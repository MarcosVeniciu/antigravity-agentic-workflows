# Agente de Documentação Técnica (`/docs`) - Technical Writer

O agente de **Documentação** atua na **Fase 4 (Encerramento & Publicação)** do ciclo de vida da funcionalidade. Sua função é manter os manuais de repositório e READMEs de diretórios sincronizados com as alterações de código finalizadas.

---

## 1. Responsabilidade e Cobertura

- **READMEs de Diretório:** Atualiza ou cria arquivos `README.md` explicativos em cada módulo ou pasta modificada.
- **Estrutura do Projeto:** Mantém o mapa da árvore de arquivos no repositório consistente.
- **Inclusão de Diagramas:** Recupera diagramas Mermaid de arquitetura definidos durante a Fase 1 e inclui nos READMEs locais.

---

## 2. Fluxo com Preview Seguro

1. O agente constrói a documentação em um artefato temporário chamado `docs_preview.md`.
2. O usuário revisa o conteúdo gerado.
3. Após aprovação, as alterações são gravadas nos arquivos `README.md` correspondentes do código.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/docs.md`
* **Skill Associada:** `skills/docs/`
* **Templates & Exemplos:** `skills/docs/resources/` e `skills/docs/references/`
