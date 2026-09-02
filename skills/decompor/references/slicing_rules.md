# Regras de Fatiamento Vertical e Decomposição de Épicos

Este manual detalha como projetar a esteira de sub-features de um épico para evitar débitos técnicos e retrabalhos.

---

## 🚫 Anti-Padrão: Fatiamento Horizontal (Camada por Camada)
* **Como NÃO fazer:**
  * Feature 1: Criar tabelas do banco.
  * Feature 2: Criar rotas da API.
  * Feature 3: Ligar a API ao banco.
* **Por que falha?** Nenhuma das features entrega valor funcional isolado e os testes unitários da Feature 1 não representam um caso de uso real.

---

## ✅ Padrão Recomendado: Fatiamento Vertical Evolutivo

Cada sub-feature deve entregar uma **fatia vertical completa** (contrato $\rightarrow$ lógica $\rightarrow$ persistência/mock $\rightarrow$ teste), obedecendo às seguintes regras:

### 1. Regra "Boundary First" (Isolamento de Fronteiras)
Se o épico introduz persistência ou comunicação externa:
* A **Sub-feature 1** define a interface tipada (ex: `IProducerRepository`) e uma implementação em memória (`MockProducerRepository`).
* O mock deve ter métodos de seed que aproveitem dados de teste existentes (ex: ler arquivos JSON legados).
* Nenhuma rota de produção é alterada ainda; o foco é criar um alicerce 100% testado.

### 2. Regra da Extensão Monotônica
* A **Sub-feature 2** deve consumir os métodos do repositório da Feature 1.
* Se a Sub-feature 2 necessitar de um novo método no repositório, ela deve **adicionar** o método, nunca alterar a assinatura dos métodos existentes.

### 3. Regra de Limite de Risco
* Mantenha sub-features críticas (como cálculo de score ou chamada de LLM) isoladas de features de cadastro/CRUD básico.
