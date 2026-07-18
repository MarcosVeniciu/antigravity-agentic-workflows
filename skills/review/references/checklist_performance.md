# Checklist: Review de Performance & Complexidade

Este documento orienta a auditoria e a correção cirúrgica de complexidade ciclomática, análise assintótica (Big-O), gargalos de ORM e acúmulo em memória.

---

## 🔄 Fase 1 — Auditoria (Localização de Evidências)
* Calcular complexidade ciclomática V(G) = E - N + 2P (máximo permitido: 10).
* Mapear complexidade assintótica (procurar buscas O(n^2) como `for x in list: if y in list_2`).
* Identificar o problema N+1 em chamadas ORM dentro de loops.
* Checar acúmulo de coleções gigantes em memória sem uso de geradores/generators.

---

## 🛠️ Fase 2 — Aplicação Cirúrgica
* Aplicar early returns (Guard Clauses) e extração de métodos para reduzir V(G) < 10.
* Converter buscas em listas para `set` ou `dict` garantindo O(1).
* Injetar `select_related`/`prefetch_related` ou joins no ORM para eliminar N+1.
* Substituir materialização em memória por `yield` (Generators).
