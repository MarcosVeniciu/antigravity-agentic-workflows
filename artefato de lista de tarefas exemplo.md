# Tarefas: Ring Buffer de Memória Compartilhada

## Fase 1: Componente SharedRingBuffer
- [x] Criar `src/benchmark/shared_ring_buffer.py` com a classe `SharedRingBuffer`
- [x] Criar testes unitários `tests/test_shared_ring_buffer.py`
- [x] Executar e validar testes unitários (17/17 passed ✅)

## Fase 2: Adaptar Pipeline e Nós
- [ ] Modificar `pipeline.py` — calcular Ring Buffers e criar filas de índices
- [ ] Modificar `frame_producer.py` — usar Ring Buffer A
- [ ] Modificar `slicer.py` — ler Ring Buffer A, gravar Ring Buffer B, mensagem agrupada
- [ ] Modificar `inference.py` — micro-batching com timeout + Ring Buffer B
- [ ] Adaptar `reconstructor.py` — ajustar formato de mensagem (se necessário)

## Fase 3: Pre-flight Test e Backends
- [ ] Modificar `pytorch_backend.py` — expandir pre-flight test (busca descendente até 8192)

## Fase 4: Monitor e Métricas
- [ ] Modificar `monitor.py` — adicionar métricas Ring Buffer A/B occupancy
- [ ] Garantir compatibilidade retroativa do CSV

## Fase 5: Configuração
- [ ] Modificar `cenarios_gpu.yaml` — adicionar `ring_buffer_ram_pct`

## Fase 6: Testes de Integração
- [ ] Criar `tests/test_ring_buffer_integration.py`
- [ ] Executar teste de integração rápido

## Fase 7: Documentação
- [ ] Atualizar `docs/benchmark/00_planejamento_e_design.md`
- [ ] Atualizar `docs/benchmark/fase3_nos_do_pipeline.md`
- [ ] Atualizar `docs/benchmark/fase4_monitor_e_pipeline.md`
