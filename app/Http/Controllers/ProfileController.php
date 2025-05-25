<?php

namespace App\Http\Controllers;

use App\Models\EnglishLevel;
use App\Models\ExperienceLevel;
use Illuminate\Http\Request;
use App\Models\Skill;
use App\Models\Contract;
use Illuminate\Support\Str;

class ProfileController
{
    public function myProfile(Request $request){
        $user = auth()->user();
        $id = $request->query('id') ?? $user->id;


        $contracts = Contract::where('user_id', $id)
            ->whereNotNull('client_rating')
            ->whereNotNull('client_feedback')
            ->with(['job'])
            ->get();

        return view('pages.Profile.profile', compact('user','contracts'));
    }

    public function myProfileSettings(){
        $user = auth()->user();
        $experienceLevels = ExperienceLevel::all();
        $englishLevels = EnglishLevel::all();
        $skills = Skill::all();
        $userSkills = $user->skills->pluck('id')->toArray();
        return view('pages.Profile.profile_settings', compact('user', 'experienceLevels', 'englishLevels', 'skills', 'userSkills'));
    }

    public function updateProfileSettings(){
        $user = auth()->user();
        $validated = request()->validate([
            'desc_title' => 'nullable|string|max:255',
            'desc_text' => 'nullable|string|max:1000',
            'experience_level_id' => 'required|exists:experience_levels,id',
            'english_level_id' => 'required|exists:english_levels,id',
            'hourly_rate' => 'nullable|numeric|min:0',
            'user_skills' => 'nullable|array',
            'user_skills.*' => 'exists:skills,id',
        ]);
        $user->update([
            'desc_title' => $validated['desc_title'],
            'desc_text' => $validated['desc_text'],
            'experience_level_id' => $validated['experience_level_id'],
            'english_level_id' => $validated['english_level_id'],
            'hourly_rate' => $validated['hourly_rate']
        ]);
        $user->skills()->sync($validated['user_skills'] ?? []);
        return redirect()->back()->with('success', 'Profile updated successfully.');
    }

    public function myProfileContact(){
        $user = auth()->user();
        return view('pages.Profile.profile_contact_info', compact('user'));
    }

    public function updateProfileContact(){
        $user = auth()->user();
        $validated = request()->validate([
            'first_name' => 'required|string|max:255',
            'middle_name' => 'nullable|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'contact_number' => 'required|numeric|digits:11',
        ]);
        $user->update([
            'first_name' => Str::title($validated['first_name']),
            'middle_name' => Str::title($validated['middle_name']),
            'last_name' => Str::title($validated['last_name']),
            'email' => $validated['email'],
            'contact_number' => $validated['contact_number'],
        ]);
        return redirect()->back()->with('success', 'Contact information updated successfully.');
    }

    public function changePassword(){
        $user = auth()->user();
        $validated = request()->validate([
            'current_password' => ['required', 'current_password'],
            'new_password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        $user->update([
            'password' => $validated['new_password'],
        ]);
        return redirect()->back()->with('success', 'Password changed successfully.');
    }


}
