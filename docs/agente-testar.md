# Reactive Debugging Agent (`/testar`)

The Debugging Agent (`/testar`) is the reactive layer of the coding flow. It enters the development lifecycle like a doctor in an operating room: acting exclusively when there is a critical failure.

---

## 1. The Agent's Focus

When the Code Agent generates the production logic and the test suite is run, if the tests fail (or if there is any runtime, syntax, or typing error), the user throws the raw error that appeared in the Pytest (or equivalent) terminal into the chat accompanied by the `/testar` command.

### Forensic Debugging
Its focus is solely on "Forensic Debugging". Unlike a feature development agent, its analytical logic acts by sweeping the sent error:
1. **Point Identification:** Reading the traces and call stacks passed by the console.
2. **Surgical Correction:** It *exclusively* alters the code responsible for the failure, limiting itself to making the pointer go from the red state (error) to the green state (success).

---

## 2. Cognitive and Scope Restriction

This agent does not analyze whether the code "is pretty" or if the architecture could be abstracted in more innovative ways. The restriction of this model occurs in its reactive objectivity.

By dealing in isolation with validation failures, Artificial Intelligence is not overwhelmed with having to think about happy paths or massive refactorings. It looks for the traceback line and promotes immediate punctual stability.

---

## 3. The Context in the TDD Flow

In the uninterrupted development flow, the agent acts as the "safety net":
1. It is triggered solely after the validation failure between the products of the **Tests Agent** and the **Code Agent**.
2. When it stabilizes the code and the user confirms that the test suite has finally achieved green coverage (Pass), its mission is over. 
3. With validated tests ensuring that there will be no behavior breakage, the dirty code that just "works" transitions freely and safely into the hands of the **Refactoring Agent**.
