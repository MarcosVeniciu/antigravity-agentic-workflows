# Antigravity IDE: Agentic Workflows

O **Antigravity IDE** não é apenas um substituto para o desenvolvedor; é um **framework de orquestração avançada** que eleva a engenharia de software a um novo patamar, utilizando agentes de Inteligência Artificial como parceiros de pair programming.

## ⚠️ O Problema Resolvido

Ao trabalhar com IA generativa em projetos complexos, engenheiros frequentemente esbarram em dois grandes obstáculos:
1. **Limitação da Janela de Contexto:** A IA "esquece" as regras de negócio e as decisões arquiteturais à medida que a sessão de desenvolvimento se prolonga.
2. **Perda de Foco (Alucinação Sistêmica):** Quando a IA tenta resolver o planejamento, a infraestrutura, os testes e o código de uma só vez, o resultado é um código frágil, acoplado e sem aderência aos princípios SOLID.

## 🚀 A Solução: Máquina de Estados e Workflows

O Antigravity resolve essas limitações dividindo o desenvolvimento de software em uma **Máquina de Estados de Agentes Especializados**. 

A mecânica principal é estruturada em torno de **gatilhos explícitos** (como `/artefatos`, `/testes`, `/codigo`), garantindo que a IA trabalhe em um escopo hiperfocado por vez. Isso assegura:
- **Pontos de Restauração Imutáveis:** A IA salva o contexto em artefatos e no Obsidian (Knowledge Graph), permitindo que qualquer nova sessão resgate a "mente" do projeto perfeitamente.
- **Isolamento de Responsabilidade:** O agente que escreve testes (Red Phase) não escreve o código de produção (Green Phase), e o agente que audita (`/review`) não é o mesmo que refatora (`/refatorar`).

## 🔄 O Ciclo Intercalado e Padrões de Qualidade

O fluxo do Antigravity impõe padrões da indústria de forma nativa:
* **BDD (Behavior-Driven Development):** O planejamento traduz as necessidades de negócio em contratos fechados antes de qualquer código ser escrito.
* **TDD Estrito (Test-Driven Development):** A transição de `/testes` garante cobertura de cenários de sucesso, falha, borda e performance, forçando o desenvolvimento do código de produção de forma reativa e segura (`/codigo`).
* **Auditoria em Loop:** A evolução do código nunca é caótica. O sistema aplica o ciclo **Review -> Refatora -> Review**, executando inspeções focadas em acoplamento, segurança e performance antes de arquivar o conhecimento final.

---

## 📂 Navegação Técnica

Para desenvolvedores e arquitetos que desejam entender as engrenagens deste ecossistema, preparamos uma documentação técnica profunda.

Mergulhe na pasta [`docs/`](./docs/):
- [Visão Geral da Arquitetura](./docs/visao-geral-arquitetura.md)
- [Agente de Planejamento](./docs/agente-planejamento.md)
- [O Gerador de Artefatos](./docs/agente-artefatos.md)
- [Ciclo de Testes e Código](./docs/agente-testes-codigo.md)
- [Auditoria e Refatoração](./docs/agente-review-refatoracao.md)