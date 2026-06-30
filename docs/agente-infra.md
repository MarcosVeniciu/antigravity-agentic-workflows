# DevOps Agent (`/infra`)

The Infrastructure Agent is not part of the main TDD loop (which focuses solely on logic). It is activated sporadically, acting as the **DevOps Engineer**, when the developer realizes that the planned new feature demands heavy infrastructure changes (new databases, massive library installation, or containerization changes).

---

## 1. The Agent's Focus

The focus is to maintain a reproducible environment. If the developer asks to "add FastAPI and Redis to the project", it will not focus on the router's business rule, it will focus on updating `requirements.txt`/`pyproject.toml`, updating `docker-compose.yml` to accommodate the Redis image, and updating the team's environment variables documentation.

---

## 2. Restrictive Quality Standards

To avoid blowing up the project by including garbage libraries or causing operational bottlenecks in the container, `/infra` adheres to three technical sanity rules before generating commands:

### License and Size Lock
When suggesting the installation of a new dependency required by the Planning Artifact, it must check for limitations. Open Source license incompatibility or unnecessary cross-dependency weight will make DevOps point out clear caveats ("Is it worth downloading all this *bloatware* just for date formatting?").

### The Ultimate Secrets Rule
This agent updates the configuration contracts, but it has the block of **never committing real passwords**. 
When new database connections are required in the infrastructure, it works by adding clean variables solely in the `.env.example` file, filling it only with *placeholder* values (`DB_PASS=YOUR_PASSWORD_HERE`), keeping the repository immune to credential leaks.

### Manual Control (`Bash`)
Just like the critical spheres of Git, the DevOps Agent does not execute `docker-compose up` or `npm install` alone. It generates the perfect command line at the end of its analysis, but pushes the manual execution of the commands to the user.
