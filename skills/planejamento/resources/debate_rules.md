# 🔍 Engineering Criteria for /grill-me Mode

When conducting technical interview with the developer, make sure to fill out the impact matrix below:

1. **System State**: How does this modification affect active contracts described in Obsidian notes?
2. **Volumetrics / Performance**: Does proposed solution scale linearly or introduce an unacceptable Big-O bottleneck?
3. **Edge Cases**: What happens if network fails, payload arrives corrupted, or database throws a deadlock?
4. **Approach Trade-offs**:
   - *Approach A (Recommended)*: Least friction with legacy, focused on simplicity and low coupling.
   - *Approach B (Alternative)*: Robust or purist approach, evaluating whether implementation cost justifies architectural return.