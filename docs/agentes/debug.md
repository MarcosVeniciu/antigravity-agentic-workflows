# Agente de Investigação Forense (`/debug`)

Enquanto o `/testar` resolve falhas diretas de asserção em tempo de desenvolvimento, o agente `/debug` assume o papel de **Investigador Forense** para falhas complexas de execução, erros de integração externa ou comportamentos anômalos em contêineres Docker.

---

## 1. Metodologia dos 5 Porquês (5 Whys)

- **Geração de Hipóteses Ponderadas:** Em vez de tentar soluções aleatórias no escuro, o agente apresenta uma tabela de hipóteses ordenadas por probabilidade antes de propor alterações.
- **Coleta de Evidências:** Solicita logs específicos do ambiente ou contêineres para comprovar cada hipótese.
- **Medida Preventiva Dupla:** Além de corrigir a falha de código, exige a gravação da solução na pasta `02-auditorias/pivots-[feature-slug].md` do Obsidian Vault ou sugere a inclusão de um teste de integração E2E para evitar que o bug reapareça.

---

## 🔀 Arquitetura Router & Skill

* **Agente Roteador:** `agents/debug.md`
* **Skill Associada:** `skills/debug/`
* **Referências de Execução:** `skills/debug/references/EXECUTION.md`
