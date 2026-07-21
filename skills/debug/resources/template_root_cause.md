# 🔍 Root Cause Analysis (RCA) - [Bug Description]

## 1. Context & Symptoms
* **Affected Component:** `[path/to/file.ext]`
* **Environment / Error:** `[Stack trace or HTTP status]`

## 2. 5 Whys Analysis (Root Cause)
1. **Why did the error occur?** `[Answer]`
2. **Why did this happen?** `[Answer]`
3. **Why was the state like this?** `[Answer]`
4. **Why was there no validation?** `[Answer]`
5. **Why did unit tests fail to catch it?** `[Definitive root cause]`

## 3. Hypothesis Matrix
| Hypothesis | Probable Cause | Impact | Evidence |
|---|---|---|---|
| H1 (Most Likely) | `[Description]` | High | `[Log/Stack Trace]` |
| H2 (Alternative) | `[Description]` | Medium | `[Config/Env]` |

## 4. Solution Alternatives
### Recommended Solution (Option A)
* **Action:** `[Explanation of change]`
* **Pros:** `[Benefits]`
* **Cons:** `[Risks]`

### Alternative Solution (Option B)
* **Action:** `[Explanation of change]`
* **Pros:** `[Benefits]`
* **Cons:** `[Risks]`

## 5. Prevention Plan & Tests
- [ ] Create regression test in `[test_path]` reproducing scenario.
- [ ] Save resolution in Obsidian Vault under `02-auditorias/pivots-[feature-slug].md`.
