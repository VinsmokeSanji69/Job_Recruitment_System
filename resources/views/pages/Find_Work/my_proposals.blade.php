<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Proposals - INHIRE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f7f9;
        }
        .navbar-brand {
            font-weight: bold;
            color: #007bff;
        }
        .nav-link {
            color: #555;
            margin-right: 1rem;
        }
        .nav-link:hover {
            color: #007bff;
        }
        .nav-item.active .nav-link {
            color: #007bff;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .form-control {
            border-radius: 0.5rem;
            border: 1px solid #e0e0e0;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
        }
        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 1rem;
            object-fit: cover;
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 1.5rem;
        }
        .proposal-section {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-bottom: 1rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        .proposal-title {
            font-size: 1.1rem;
            color: #34495e;
            margin-bottom: 0.5rem;
        }
        .proposal-count {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 1rem;
        }
        .nav-tabs .nav-link {
            border: none;
            border-bottom: 2px solid transparent;
            color: #555;
            margin-right: 1rem;
            cursor: pointer;
            transition: color 0.3s ease, border-bottom-color 0.3s ease;
        }

        .nav-tabs .nav-link:hover {
            color: #007bff;
            border-bottom-color: #007bff;
        }

        .nav-tabs .nav-link.active {
            color: #007bff;
            font-weight: bold;
            border-bottom-color: #007bff;
        }

        .tab-content {
            margin-top: 1.5rem;
        }

        .proposal-card {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 0.5rem;
            padding: 1.5rem;
            margin-bottom: 1rem;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        .proposal-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .proposal-section p{
            margin-bottom: 0;
        }

    </style>
</head>
<body>
<header class="bg-white py-3 border-bottom">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">INHIRE</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="findWorkDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Find Work
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="findWorkDropdown">
                            <li><a class="dropdown-item" href="{{ route('home') }}">Find Work</a></li>
                            <li><a class="dropdown-item" href="{{ route('findwork.myproposals') }}">My Proposals</a></li>
                            <li></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="findWorkDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Deliver Work
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="deliverWorkDropdown">
                            <li><a class="dropdown-item" href="{{ route('deliverwork.activecontracts') }}">Your Active Contracts</a></li>
                            <li><a class="dropdown-item" href="{{ route('deliverwork.historycontracts') }}">Contract History</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle"href="{{ route('findwork.myjobposts') }}">My Job Posts</a>
                    </li>
                    <li class="nav-item">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search for jobs" aria-label="Search">
                            <a href="/Views/Search/searched_result.html"><button class="btn btn-primary" type="button" id="button-addon2">Search</button></a>
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button"
                           id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="user-info">
                                <img src="{{ asset('icons/icon_profile.png') }}" alt="User Avatar" class="avatar">
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                            <li><a class="dropdown-item" href="{{ route('myProfile') }}">My Profile</a></li>
                            <li><a class="dropdown-item" href="{{ route('myProfileSettings') }}">Profile Settings</a></li>
                            <li><a class="dropdown-item" href="{{ route('myProfileContact') }}">Contact Info</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form action="{{ route('logout') }}" method="POST">
                                    @csrf
                                    <button type="submit" class="dropdown-item">Logout</button>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>

<main class="container py-4">
    <section class="mb-4">
        <h2 class="section-title">My Proposals</h2>
        <p class="lead">Manage your proposals and track their status.</p>
    </section>

    <section class="mb-4">
        <nav class="nav nav-tabs">
            <a class="nav-link active" href="#active-proposals" data-bs-toggle="tab">Active</a>
            <a class="nav-link" href="#archived-proposals" data-bs-toggle="tab">Archived</a>
        </nav>

        <div class="tab-content">
            <!-- Active Proposals -->
            <div class="tab-pane fade show active" id="active-proposals">
                <div class="proposal-section">
                    <h3 class="proposal-title">Active Proposals</h3>
                    <p class="proposal-count">
                        Number of active proposals: {{ $activeProposals->count() }}
                    </p>

                    <div id="active-proposals-list">
                        @forelse($activeProposals as $proposal)
                            <div class="proposal-card"
                                 data-title="Proposal from {{ optional($proposal->job->user)->first_name ?? 'Unknown' }}"
                                 data-description="{{ Str::limit($proposal->letter, 100) }}"
                                 data-proposed-date="{{ $proposal->created_at->format('M d, Y') }}"
                                 data-name="{{ optional($proposal->job->user)->first_name ?? 'Unknown' }}">

                                <p><b>Proposal To {{ optional($proposal->job->user)->first_name ?? 'Unknown' }}</b></p>
                                <p>Status: <span class="badge bg-warning text-dark">{{ ucfirst($proposal->status) }}</span></p>
                                <p>Proposed Date: {{ $proposal->created_at->format('M d, Y') }}</p>

                                <div class="d-flex justify-content-between">
                                    <a href="{{ route('proposaldetails', ['job_id' => $proposal->job_id,'user_id' => $proposal->user_id]) }}" class="btn btn-primary view-details-btn">
                                        View Details
                                    </a>
                                @if($proposal->status === 'interviewed')
                                    <p>Interview Date: {{ \Carbon\Carbon::parse($proposal->interview_date)->format('M d, Y') }}</p>
                                    <p>Interview Time: {{ $proposal->interview_time }}</p>
                                @endif
                                </div>
                            </div>
                        @empty
                            <p>No active proposals yet.</p>
                        @endforelse
                    </div>
                </div>
            </div>

            <!-- Archived Proposals -->
            <div class="tab-pane fade" id="archived-proposals">
                <div class="proposal-section">
                    <h3 class="proposal-title">Archived Proposals</h3>
                    <p class="proposal-count">
                        Number of archived proposals: {{ $archivedProposals->count() }}
                    </p>
                    <div id="archived-proposals-list">
                        @forelse($archivedProposals as $proposal)
                            <div class="proposal-card">
                                <p><b>Proposal To {{ optional($proposal->job->user)->first_name ?? 'Unknown' }}</b></p>
                                <p>Status: <span class="badge bg-secondary">{{ ucfirst($proposal->status) }}</span></p>
                                <p>Proposed Date: {{ $proposal->created_at->format('M d, Y') }}</p>
                                <a href="{{ route('proposaldetails', ['job_id' => $proposal->job_id, 'duration_id' => optional($proposal->duration)->id]) }}"
                                   class="btn btn-primary view-details-btn">
                                    View Details
                                </a>
                            </div>
                        @empty
                            <p>No archived proposals yet.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<footer class="bg-light py-3 border-top">
    <div class="container text-center">
        <p>&copy; 2025 INHIRE. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/your-font-awesome-kit.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const findWorkDropdown = document.getElementById('findWorkDropdown');
        const deliverWorkDropdown = document.getElementById('deliverWorkDropdown');
        const navbarNavItems = document.querySelectorAll('.navbar-nav .nav-item');

        if (findWorkDropdown && deliverWorkDropdown) {
            // Remove the original event listeners for "Find Work" and "Deliver Work"
            findWorkDropdown.removeAttribute('href');
            deliverWorkDropdown.removeAttribute('href');
        }
        // Set "Find Work" as active by default
        navbarNavItems.forEach(navItem => navItem.classList.remove('active'));
        const findWorkNavItem = Array.from(navbarNavItems).find(navItem => navItem.querySelector('#findWorkDropdown'));
        if (findWorkNavItem) {
            findWorkNavItem.classList.add('active');
        }
    });
</script>
</body>
</html>
