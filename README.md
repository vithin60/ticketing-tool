# Ticketing Tool

A full-stack ticket and task management application designed to help teams create, assign, track, and manage work efficiently.

## Project Overview

Ticketing Tool provides separate workflows for administrators and employees. The application supports authentication, role-based access control, task management, notifications, AI-assisted functionality, PDF generation, and cloud deployment.

This project was developed as a group project. My primary contribution was focused on AWS deployment, IAM configuration, EC2 infrastructure, security, and CloudWatch monitoring.

## Key Features

### Authentication and Authorization

* JWT-based authentication
* Access and refresh token management
* Role-based access control
* Separate Admin and Employee workflows
* Password hashing using bcrypt
* Protected API routes and authorization middleware

### Ticket and Task Management

* Create and manage tasks and tickets
* Assign tasks to employees
* Track task status and progress
* Task priority and effort tracking
* Task comments and updates
* Employee task dashboard
* Admin task management dashboard

### User and Employee Management

* Employee management
* User profile management
* Role-based permissions
* Employee activation and deactivation
* Admin-controlled task assignment

### Notifications

* Email notifications
* Push notifications
* Notification management
* Automated notification handling
* Scheduled background jobs

### AI Assistant

* AI-powered assistant integrated into the application
* Google Gemini integration
* LangChain-based AI services
* LangGraph workflow orchestration
* AI-assisted interaction with application data

### PDF Generation

* Server-side PDF generation
* Task-related document generation
* Backend-based PDF processing

## System Architecture

```text
                         Users
                    Admin / Employee
                           |
                           v
                 +-------------------+
                 | Next.js Frontend  |
                 | React / TypeScript|
                 +---------+---------+
                           |
                        REST API
                           |
                           v
                 +-------------------+
                 |  Express Backend  |
                 | Node.js / TypeScript|
                 +---------+---------+
                           |
              +------------+------------+
              |            |            |
              v            v            v
        +-----------+ +-----------+ +-----------+
        | PostgreSQL| |  Prisma   | |    AI     |
        | Database  | |   ORM     | | Services  |
        +-----------+ +-----------+ | Gemini /  |
                                    | LangChain |
                                    +-----------+

                    AWS Infrastructure
                           |
              +------------+------------+
              |            |            |
              v            v            v
         +---------+   +---------+   +------------+
         |   EC2   |   |   IAM   |   | CloudWatch |
         | Hosting |   | Security|   | Monitoring |
         +---------+   +---------+   +------------+
```

## Technology Stack

### Frontend

| Technology     | Purpose                      |
| -------------- | ---------------------------- |
| Next.js        | Frontend framework           |
| React          | User interface development   |
| TypeScript     | Type-safe development        |
| TanStack Query | Server-state management      |
| Redux Toolkit  | Application state management |
| Axios          | API communication            |
| Zod            | Data validation              |
| CSS            | Styling                      |

### Backend

| Technology        | Purpose                       |
| ----------------- | ----------------------------- |
| Node.js           | Backend runtime               |
| Express.js        | REST API framework            |
| TypeScript        | Type-safe backend development |
| Prisma            | ORM and database access       |
| PostgreSQL        | Relational database           |
| JWT               | Authentication                |
| bcrypt            | Password hashing              |
| Helmet            | HTTP security                 |
| Express Validator | Request validation            |
| Multer            | File uploads                  |
| PDFKit            | PDF generation                |
| Nodemailer        | Email services                |
| node-cron         | Scheduled background jobs     |

### AI

| Technology    | Purpose                   |
| ------------- | ------------------------- |
| Google Gemini | Generative AI             |
| LangChain     | AI application framework  |
| LangGraph     | AI workflow orchestration |

### Cloud and Deployment

| Technology     | Purpose                        |
| -------------- | ------------------------------ |
| AWS EC2        | Application hosting            |
| AWS IAM        | Identity and access management |
| AWS CloudWatch | Infrastructure monitoring      |
| Docker         | Containerization               |
| Docker Compose | Container orchestration        |

## My Contribution

This was developed as a group project. My primary responsibility was the AWS deployment and infrastructure side.

### IAM

* Created and managed IAM users
* Created IAM policies
* Attached appropriate policies to users and roles
* Configured permissions required for AWS resources
* Worked with IAM roles for EC2
* Applied least-privilege access principles

### EC2

* Configured EC2 instances for application deployment
* Prepared the server environment
* Supported application deployment and execution
* Configured required access and security settings
* Worked with instance-level IAM roles

### CloudWatch

* Configured monitoring for EC2
* Monitored instance metrics
* Checked CPU utilization and system health
* Used CloudWatch for server and infrastructure monitoring

### Deployment Flow

```text
Developer Code
      |
      v
GitHub Repository
      |
      v
AWS EC2 Instance
      |
      +---- Frontend
      |
      +---- Backend
               |
               v
           PostgreSQL

AWS IAM
   |
   +---- Controls access to AWS resources

AWS CloudWatch
   |
   +---- Monitors EC2 infrastructure
```

## Application Flow

```text
User
 |
 v
Login
 |
 v
JWT Authentication
 |
 v
Role Verification
 |
 +------------------+
 |                  |
 v                  v
Admin            Employee
 |                  |
 v                  v
Dashboard        Dashboard
 |                  |
 v                  v
Manage Tasks     Assigned Tasks
 |                  |
 +--------+---------+
          |
          v
     Backend API
          |
          v
      Prisma ORM
          |
          v
      PostgreSQL
```

## Security

The application uses multiple layers of security:

* JWT-based authentication
* Access and refresh tokens
* Password hashing using bcrypt
* Role-based authorization
* Request validation
* HTTP security headers using Helmet
* CORS configuration
* Environment-based configuration
* AWS IAM access control
* IAM roles for EC2
* Least-privilege permissions

Environment files containing credentials, API keys, and other sensitive configuration are excluded from version control.

## Project Structure

```text
TicketingTool/
|
+-- backend/
|   +-- prisma/
|   |   +-- migrations/
|   |   +-- schema.prisma
|   |
|   +-- src/
|   |   +-- config/
|   |   +-- middlewares/
|   |   +-- modules/
|   |   |   +-- agent/
|   |   |   +-- audit/
|   |   |   +-- auth/
|   |   |   +-- effort/
|   |   |   +-- jobs/
|   |   |   +-- notifications/
|   |   |   +-- tasks/
|   |   |   +-- users/
|   |   +-- utils/
|   |
|   +-- package.json
|   +-- Dockerfile
|   +-- tsconfig.json
|
+-- frontend/
|   +-- public/
|   +-- src/
|   |   +-- app/
|   |   +-- components/
|   |   +-- hooks/
|   |   +-- lib/
|   |   +-- schemas/
|   |   +-- services/
|   |   +-- store/
|   |   +-- types/
|   |
|   +-- package.json
|   +-- Dockerfile
|   +-- next.config.ts
|
+-- README.md
```

## Running Locally

### Prerequisites

* Node.js
* npm
* PostgreSQL
* Git

### Clone the Repository

```bash
git clone https://github.com/vithin60/ticketing-tool.git
cd ticketing-tool
```

### Backend Setup

```bash
cd backend
npm install
```

Create a `.env` file based on `.env.example` and configure the required environment variables.

Generate the Prisma client:

```bash
npm run prisma:generate
```

Run database migrations:

```bash
npm run prisma:migrate
```

Start the development server:

```bash
npm run dev
```

### Frontend Setup

Open another terminal and run:

```bash
cd frontend
npm install
```

Create the required `.env` file based on `.env.example`.

Start the frontend:

```bash
npm run dev
```

The frontend communicates with the backend through the configured REST API endpoints.

## Development Commands

### Backend Development

```bash
cd backend
npm run dev
```

### Frontend Development

```bash
cd frontend
npm run dev
```

### Build Backend

```bash
cd backend
npm run build
```

### Start Production Backend

```bash
cd backend
npm start
```

## Project Information

| Category          | Details                             |
| ----------------- | ----------------------------------- |
| Project           | Ticketing Tool                      |
| Project Type      | Group Project                       |
| Architecture      | Full Stack + Cloud Deployment       |
| Frontend          | Next.js, React, TypeScript          |
| Backend           | Node.js, Express, TypeScript        |
| Database          | PostgreSQL                          |
| ORM               | Prisma                              |
| AI                | Google Gemini, LangChain, LangGraph |
| Cloud             | AWS                                 |
| Hosting           | AWS EC2                             |
| Monitoring        | AWS CloudWatch                      |
| Access Management | AWS IAM                             |

## Future Improvements

* CI/CD pipeline using GitHub Actions
* HTTPS and custom domain configuration
* Automated AWS deployment
* Centralized application logging
* Production database hosting
* Automated testing and improved test coverage
* Advanced CloudWatch dashboards and alarms
* Enhanced AI agent capabilities

## Repository

GitHub: https://github.com/vithin60/ticketing-tool
