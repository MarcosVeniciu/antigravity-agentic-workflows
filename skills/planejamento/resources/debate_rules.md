# 🔍 Critérios de Engenharia para o modo /grill-me

Ao conduzir a entrevista técnica com o desenvolvedor, certifique-se de preencher a matriz de impacto abaixo:

1. **Estado do Sistema**: Como essa modificação afeta os contratos vigentes descritos nas notas do Obsidian?
2. **Volumetria / Performance**: A solução proposta escala linearmente ou introduz um gargalo Big-O inaceitável?
3. **Casos de Borda**: O que acontece se a rede falhar, o payload vier corrompido ou o banco de dados lançar um deadlock?
4. **Trade-off de Abordagens**:
   - *Abordagem A (Recomendada)*: Menor atrito com o legado, focada em simplicidade e baixo acoplamento.
   - *Abordagem B (Alternativa)*: Abordagem robusta ou purista, avaliando se o custo de implementação compensa o retorno arquitetural.