# Reactive Debugging Agent (`/testar`)

The Debugging Agent (`/testar`) is the reactive layer of the coding flow. It enters the development lifecycle like a doctor in an operating room: acting exclusively when there is a critical failure.

---

## 1. The Agent's Focus

When the Code Agent generates the production logic and the test suite is run, if the tests fail (or if there is any runtime, syntax, or typing error), the user throws the raw error that appeared in the Pytest (or equivalent) terminal into the chat accompanied by the `/testar` command.

### Forensic Debugging
Its focus is solely on "Forensic Debugging". Unlike a feature development agent, its analytical logic acts by sweeping the sent error:
1. **Pre-Flight SDD Check:** It checks the Implementation Plan Artifact (SDD) to guarantee any corrections remain strictly within the architectural boundaries.
2. **Error Parsing & Iterative Update:** Rather than attempting to solve every error in one massive block, it reads the error output, creates an error checklist (`task.md`), and uses the **Iterative Update Rule**. It picks one failing test, categorizes the root cause (e.g., Type Mismatch, Missing Import, Logic Error), applies the fix, marks the task complete, and moves to the next.
3. **Surgical Correction:** It *exclusively* alters the code responsible for the failure, limiting itself to making the pointer go from the red state (error) to the green state (success). 

---

## 2. Cognitive and Scope Restriction

This agent does not analyze whether the code "is pretty" or if the architecture could be abstracted in more innovative ways. The restriction of this model occurs in its reactive objectivity.

**Strict Constraints:**
- **No New Features:** It is strictly forbidden from adding any functionality beyond what is needed to make the tests pass.
- **No Refactoring:** It is forbidden from cleaning code smells during this phase.
- **No Modifying Valid Tests:** It cannot simply modify or weaken a test to bypass a code failure, unless the test itself objectively contains a bug.
- **No Autonomous Execution:** Terminal commands are returned strictly inside a single, isolated bash block for manual execution.

By dealing in isolation with validation failures, Artificial Intelligence is not overwhelmed with having to think about happy paths or massive refactorings. It looks for the traceback line and promotes immediate punctual stability.

---

## 3. The Context in the Workflow (Stateless Operation)

In the uninterrupted development flow, the agent acts as a stateless "safety net" across multiple phases:
1. **Coding Phase:** Triggered if tests fail after the Code Agent. Once green, it returns the flow to the **Refactoring Agent**.
2. **Refactoring Phase:** Triggered if the Refactoring Agent breaks tests. Once green, it returns the flow to the **Review Phase**.
3. **Review Phase:** Triggered if applying an audit (`/aplicar-review`) breaks tests. Once green, it returns the flow to the next step of the **Review Chain**.

Because it acts independently of the global state, its mission ends the moment the tests pass, seamlessly returning control to the user's current track.
