# O Gerador de Artefatos (`/artefatos`)

O **Blueprint Generator** entra em ação logo após a fase de planejamento. O objetivo deste agente é traduzir uma conversa em português (ou inglês) em um **Plano de Implementação** altamente técnico e inquestionável.

## Mecânica de Execução

1. **Verificação de Regras:** O agente lê os domínios `05-architecture-map/` e `04-domain-rules/` do Obsidian para garantir compatibilidade.
2. **Template Rígido:** Ele busca o `template_artefatos.md` para formatar a saída.
3. **Passo a Passo Técnico:** O artefato gerado contém etapas atômicas:
   - Qual arquivo criar.
   - O porquê (lógica de negócio).
   - O critério de aceitação (para os testes).
   - As dependências de outras funções.
4. **Geração de Diagramas:** Todo plano recebe pelo menos um diagrama em formato Mermaid.js (Diagrama de Classe, Sequência ou ER), transformando código hipotético em uma visão espacial.

## Benefício no Fluxo

Ao documentar a arquitetura antes do código, previne-se o retrabalho. Se o artefato parece incorreto ou super-projetado, o desenvolvedor pode pivotar a ideia antes mesmo da IA escrever a primeira linha da suíte de testes.
