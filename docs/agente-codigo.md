# Code Agent (`/codigo`) - The Green Phase

The Code Agent is the execution arm in the **Antigravity IDE** assembly line. It springs into action solely when the test suite (Red Phase) has been structured and archived, and it operates focusing on the **Green Phase** cycle (Make the Test Pass).

---

## 1. The Agent's Focus

The central goal of this agent is to write the **minimum necessary production logic**. 

It reads the tests created in the previous step and bases itself on them to determine the exact scope of its action. The premise is simple and brutal: *Do not write a single extra line that is not to satisfy the test assertion*.

### Preventing "Workarounds" and Hallucinations
This highly restrictive approach serves as a "leash" for Artificial Intelligence.
An AI, left free to develop features based only on a high-level description, will tend to hallucinate (invent unnecessary libraries), expand the scope (create extra methods that no one asked for), and produce obscure solutions ("workarounds").

The test, surgically generated in the previous phase, creates a narrow corridor where the code agent must mandatorily travel. If there is no test covering the extra feature imagined by the AI, the extra feature **is not created**.

### Cognitive Reduction and the `task.md` Artifact
In architectures or more complex features, attempting to process dozens of tests and their logical correlations at the same time can cause an attention *overflow* (token limits) and algorithmic quality degradation.

To circumvent this, this agent can make use of the `task.md` artifact. By creating a purely sequential implementation list, it does not need to keep all the project's complexity in mind all the time. It picks a task from the list, builds it, satisfies the referenced test, and moves on, breaking a giant problem into simple-to-solve gears.

---

## 2. Docstrings and Domain Patterns

The agent is not only focused on raw code. Its second vital responsibility is to ensure code maintainability by tying it to Domain Rules.
* **Rigid Docstrings:** When documenting methods or classes, it mandatorily links the reasoning to the "Second Brain" (Obsidian), leaving clear references of where the technical rule came from, e.g.: `Ref: Obsidian note [[2026-06-24-login-rules]]`.

---

## 3. The Context in the TDD Flow

This agent acts sandwiched in the development cycle:
1. It is activated only after the **Tests Agent** (`/testes`) has prepared the validation suite.
2. Its primary focus is solely "code that works". Issues of architectural standardization or deep readability improvements ("pretty code") are not its primary responsibility at this moment. 
3. Once the code fulfills the function, it is passed on to the **Test Agent** (in case of a terminal failure) or straight to the **Refactor Agent** (where aesthetic improvements and SOLID principles are polished on a now stable base).
