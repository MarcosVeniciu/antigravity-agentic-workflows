# Ciclo de Testes e Código (A Engrenagem TDD)

O coração da segurança do **Antigravity IDE** reside na separação severa entre quem escreve os testes e quem desenvolve a solução.

## Fase 1: SDET (`/testes`)
O agente focado em QA age em cima do contrato gerado pelos Artefatos.
- **Proibido de ver lógica:** Este agente não gera código de produção.
- **Categorização:** Ele divide o desenvolvimento da suíte em 4 pilares: *Happy Path*, *Edge Cases*, *Exceptions* e *Performance/Scaling*.
- **O Foco em Escalabilidade:** Uma das grandes inovações é a injeção de testes de "Native Profiling", forçando a impressão no terminal de tabelas de tempo x inputs (N), preparando o terreno para análises de complexidade Assintótica (Big-O).

## Fase 2: Implementation Engineer (`/codigo`)
Acionado somente após os testes estarem salvos.
- **Objetivo Mínimo:** Escreve *apenas* o código necessário para fazer o teste passar (Green Phase), nem uma linha a mais.
- **Docstrings Padronizadas:** Todo método e classe é documentado referenciando a regra de domínio extraída diretamente do Obsidian, por exemplo: `Ref: Obsidian note [[2026-06-24-regra-xyz]]`.

## A Fase Reativa (`/testar`)
Caso o comando de teste (`pytest`, por exemplo) executado pelo usuário falhe, a saída de erro do terminal é passada para o agente `/testar`. Este é o **Debug Forense**: ele analisa a call stack e o trace, consertando cirurgicamente a falha de tipagem, assert ou lógica, promovendo estabilidade imediata.
