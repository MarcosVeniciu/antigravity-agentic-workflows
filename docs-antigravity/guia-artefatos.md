# Guia de Referência: Sistema de Artefatos no Antigravity

Este documento detalha o funcionamento dos **Artefatos**, que são arquivos Markdown estruturados e interativos renderizados em uma aba dedicada da IDE durante as conversas e fluxos de agente.

---

## 1. O que é um Artefato?
Artefatos são documentos de acompanhamento (planos de implementação, relatórios de auditoria, walkthroughs, listas de tarefas) salvos no diretório da sessão atual (`<appDataDir>\brain\<conversation-id>`). 

Em vez de enviar longos textos no chat, a IA cria estes arquivos e a IDE os apresenta em um painel visual rico e persistente.

---

## 2. O Metadado de Artefato (`ArtifactMetadata`)
Quando a IA cria ou altera um artefato através de ferramentas de edição, ela fornece o objeto `ArtifactMetadata`:

* **`UserFacing` (`true`/`false`):** Define se o arquivo deve aparecer na interface visual do usuário. Se for `false`, é tratado como rascunho temporário na pasta `/scratch/`.
* **`RequestFeedback` (`true`/`false`):** **Ativa a pausa interativa e exibe o botão "Proceed" (Prosseguir).** Quando marcado como `true`, a IA interrompe o processamento e aguarda a aprovação ou feedback do usuário no painel visual antes de continuar a execução.
* **`Summary`:** Breve resumo textual detalhando as mudanças feitas no artefato.

---

## 3. Detalhamento dos Tipos Principais e Predefinidos

### 📐 1. Plano de Implementação (`implementation_plan.md`)
* **Propósito:** Apresentar a proposta técnica detalhada antes de realizar alterações no código-fonte do projeto.
* **Comportamento no Sistema:** É o artefato exigido durante o **Planning Mode**. Sempre gerado com `RequestFeedback: true` para que a IDE exiba o botão "Proceed" e pause a execução até a aprovação do usuário.
* **Estrutura Padrão:**
  * **Goal Description:** Contexto do problema e objetivo da mudança.
  * **User Review Required / Open Questions:** Decisões de design ou perguntas críticas destacadas com alertas (`> [!IMPORTANT]`).
  * **Proposed Changes:** Agrupamento de mudanças por componente e arquivos demarcados com tags:
    * `#### [MODIFY] [nome_arquivo](file:///caminho/absoluto)`
    * `#### [NEW] [nome_arquivo](file:///caminho/absoluto)`
    * `#### [DELETE] [nome_arquivo](file:///caminho/absoluto)`
  * **Verification Plan:** Comandos de testes automatizados e testes manuais recomendados.

### 📋 2. Lista de Tarefas / TODO (`task_list.md` ou `todo.md`)
* **Propósito:** Oferecer acompanhamento dinâmico e visual em tempo real para tarefas multi-etapas, refatorações extensas ou migrações.
* **Comportamento no Sistema:** A IA atualiza o arquivo cirurgicamente (`replace_file_content`) conforme progride nas etapas, atualizando o indicador de progresso e as marcações visuais na IDE.
* **Convenção de Checkboxes e Estados:**
  * `- [ ]` **Pendente:** Tarefa mapeada no escopo, aguardando início.
  * `- [/]` **Em Progresso:** Tarefa que a IA está executando no momento exato.
  * `- [x]` **Concluída:** Tarefa concluída e validada.
  * `- [-]` **Cancelada/Ignorada:** Tarefa que se tornou irrelevante após mudanças de escopo.

### 🚶 3. Guia de Conclusão / Walkthrough (`walkthrough.md`)
* **Propósito:** Demonstrar e validar os resultados alcançados ao final de uma implementação ou correção.
* **Comportamento no Sistema:** É gerado/atualizado ao concluir as tarefas de um plano.
* **Estrutura Padrão:**
  * **Changes Made:** Lista resumida com links diretos para os arquivos modificados.
  * **Verification Results:** Logs de terminal dos testes executados com sucesso.
  * **Visual Proofs:** Evidências visuais (imagens, prints ou vídeos WebP gravados por subagentes web).

---

## 4. Tipos Especializados de Artefatos do Workflow

Além dos três tipos principais acima, existem formatos especializados já configurados em workflows de agentes:

* **🛡️ Relatório de Auditoria e Review (`code_review_report.md`):** Gerado no workflow `/review`. Traz tabela de dívida técnica, vulnerabilidades de segurança, violações de SOLID e plano de refatoração por prioridade.
* **🔬 Investigação Forense e Debug (`root_cause_analysis.md`):** Gerado no workflow `/debug`. Contém passos de reprodução, logs extraídos, hipóteses descartadas/confirmadas e plano de correção da causa raiz.
* **📑 Especificação BDD / Casos de Teste (`bdd_specs.md`):** Gerado no workflow `/testes`. Contém especificações de comportamento em sintaxe Gherkin (`Dado...`, `Quando...`, `Então...`).
* **🏛️ Registro de Decisão Arquitetural (`adr_draft.md`):** Propostas estruturadas de mudanças de arquitetura para aprovação e inclusão no Obsidian Vault.

---

## 5. Como Criar Novos Tipos Personalizados de Artefatos

Você pode criar e padronizar qualquer novo tipo de artefato customizado para as necessidades do seu projeto ou equipe.

### Mecanismo de Funcionamento
A IDE reconhece qualquer arquivo com extensão `.md` gerado no diretório de artefatos da sessão (`<appDataDir>\brain\<conversation-id>`). O artefato torna-se um painel interativo quando criado com `UserFacing: true`.

### Passo a Passo para Criar um Artefato Personalizado:

1. **Defina o Nome Semântico do Arquivo:** Exemplo: `relatorio_seguranca_api.md`, `analise_desempenho.md`, `plano_migracao.md`.
2. **Configure o `ArtifactMetadata`:**
   * `UserFacing: true` (torna visível no painel da IDE).
   * `RequestFeedback: true` (adiciona o botão "Proceed" e faz a IA aguardar aprovação antes de prosseguir).
   * `Summary: "Descrição breve do que este artefato contém"`.
3. **Instrua a IA via Skill ou Regra de Projeto:**
   Adicione uma instrução no seu arquivo `AGENTS.md` ou em uma **Skill** dedicada:

   ```markdown
   Quando for realizar uma análise de cobertura de código:
   1. Gere um artefato personalizado chamado `relatorio_cobertura.md`.
   2. Configure UserFacing = true e RequestFeedback = false.
   3. Estruture o documento com:
      - Tabela de Cobertura por Módulo
      - Lista de Métodos Sem Testes Unitários
      - Diagrama Mermaid de Dependências Não Testadas
   ```

---

## 6. Recursos Visuais Avançados em Artefatos

Todos os artefatos (padrão ou personalizados) suportam componentes visuais ricos:

* **Diagramas Mermaid (`mermaid`):** Fluxogramas, diagramas de sequência, mapas mentais e modelos Entidade-Relacionamento.
* **Alertas do GitHub:** `> [!NOTE]`, `> [!TIP]`, `> [!IMPORTANT]`, `> [!WARNING]`, `> [!CAUTION]`.
* **Blocos Diff (`diff`):** Comparação visual de adições (`+`) e remoções (`-`).
* **Carrosséis (`carousel`):** Slides sequenciais para exibição de imagens, screenshots ou alternativas de código.
