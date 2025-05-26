# Job Marketplace Platform System

This is a web-based job marketplace system that connects **clients** (employers) and **talents** (freelancers). The platform facilitates job postings, proposal submissions, contract management, and mutual reviews between users.

> 💡 **Note:** A user can act both as a client and a talent. For example, someone can post a job (as a client) and also apply to another job (as a talent).

---

## 📌 Objectives of the System

### For Clients:
- Post job offerings (hourly or fixed price)
- Manage proposals submitted by talents
- Manage hire contracts with accepted talents
- Leave reviews and ratings for talents after contract completion

### For Talents:
- Set up and manage their profile
- Search for job postings
- Submit proposals to jobs
- Leave reviews and ratings for clients

---

## 🏗️ Key Entities

### `USER`
Represents both clients and talents. Includes fields for name, contact details, experience level, and English proficiency.  
A user can switch roles depending on the action (e.g., post a job or submit a proposal).

### `JOB`
Represents job listings created by clients. Jobs can be either **fixed-price** or **hourly** types.

### `PROPOSAL`
Represents applications submitted by talents for jobs. Includes bid amount, interview details, and status.

### `CONTRACT`
Represents a formal agreement between a client and a talent, including payment, status, and mutual reviews.

### `USER_SKILL` and `SKILL`
Defines the skills that a user can list on their profile.

---

## 🛠 Technologies Used

- **Backend:** PHP / Laravel  
- **Database:** PostgreSQL  
- **Frontend:** HTML, CSS, Bootstrap, JavaScript  
- **Tools:** PhpStorm, Git, GitHub

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/VinsmokeSanji69/Job_Recruitment_System.git
cd Job_Recruitment_System
