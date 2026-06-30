# Documentation Agent (`/docs`)

The Documentation Agent acts in the "Closure Phase" of the development cycle. Its goal is not to write logical code, but to act as the **Technical Writer**, ensuring that any developer entering the codebase knows exactly what the module does without having to decipher the code.

---

## 1. The Agent's Focus

This agent consolidates the documentation of the repository's folders and modules (directory-level `README.md`) and updates the main project mapping (Root `README.md`). 

It reads the files that were modified during the development session and documents:
* What the directory is.
* How data flows within it.
* The responsibilities of each file.
* Design decisions and technical trade-offs.

---

## 2. Rigorous Standardization

To maintain consistency, `/docs` follows strict template-based restrictions:

### The Use of Preview (`docs_preview.md`)
The agent **never directly alters** the `README.md` file on disk right away. 
1. It collects the `08-templates/template_doc_diretorio.md` template.
2. Fills in the data generating a temporary artifact called `docs_preview.md`.
3. Waits for the user to read and validate ("ok") before making the changes in the local repository.

### Visuo-Textual Architectural Tying
In the "Architecture and Data Flow" section of the template, the agent cannot invent shallow text. 
It is obliged to fetch the structural **Mermaid Diagram** generated much earlier, in the Artifacts Phase (`/artefatos`), and paste it into the documentation. Furthermore, it must include the **Obsidian Note Link** where the extended architecture is saved, uniting the macro vision (diagram), the textual vision (documented code), and the second brain (Vault).

### The Project Tree (Root)
If files or folders were created or deleted, the agent formats and suggests the updated block of the *Project Structure Tree* for the root repository, ensuring that the physical mental map of the application is always in sync with reality.
