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

To circumvent this, this agent employs the **Iterative Update Rule**. It creates a `task.md` checklist containing every method, class, and file to implement. Then, instead of building everything in a single burst, it selectively works on one pending task `[/]`, makes the code changes, marks it completed `[x]`, and then moves to the next. It breaks a giant problem into simple-to-solve gears.

---

## 2. Structural Quality and SOLID

While the focus is making tests pass, structural quality is maintained via explicit constraints:
- **SOLID Principles:** Whenever the agent applies a SOLID principle, it MUST explicitly describe it in the code comments or docstrings, preventing subjective interpretations.
- **Explicit over Implicit:** It favors explicit type hints and error handling.
- **Standardized Tags:** If there is tech debt outside the immediate scope, it uses standard developer tags (e.g., `TODO`, `FIXME`, `OPTIMIZE`, `HACK`) rather than trying to fix it out of bounds.

---

## 3. Docstrings and Domain Patterns

The agent is not only focused on raw code. Its second vital responsibility is to ensure code maintainability by tying it to Domain Rules.
* **Structured Docstrings:** Every new or modified structure must receive a complete docstring (e.g., Google Style) defining Purpose, Arguments, Returns, Raises, and Domain Context.
* **Rigid Links to Obsidian:** When referencing domain or architecture rules, it mandatorily links the reasoning to the "Second Brain" (Obsidian), leaving clear references of where the technical rule came from, using the exact format: `Ref: Obsidian note [[note-name]]` (e.g., `[[2026-06-24-login-rules]]`).

---

## 4. Strict Terminal Constraints

The Code Agent is restricted from running terminal commands autonomously. It only generates the production code, and then provides a **single, isolated bash block** containing exactly the test execution command (e.g., `pytest path/to/test_file.py -v`) for the user to copy and run manually.

---

## 5. The Context in the TDD Flow

This agent acts sandwiched in the development cycle:
1. It is activated only after the **Tests Agent** (`/testes`) has prepared the validation suite.
2. Its primary focus is solely "code that works". 
3. Once the code fulfills the function, it is passed on to the **Test Agent** (in case of a terminal failure) or straight to the **Refactor Agent** (`/refatorar`) where deeper aesthetic improvements and structural best practices are polished on a now stable base.


---

## 🔀 Dynamic State Machine Router

This agent is built using the **State Machine Router (Dynamic Context)** architecture. To prevent prompt hallucination, the trigger in `workflows/codigo.md` is purely a lightweight router.

When invoked, the agent dynamically fetches its heavy execution instructions from the Obsidian Vault (`08-templates-and-workflows/`) using the MCP:
- `workflow-codigo-EXECUTION.md`
