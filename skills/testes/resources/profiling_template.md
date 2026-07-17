# Template: Relatório Nativo de Profiling (Big-O)

Este template orienta a estrutura de relatórios de tempo de execução impressos no `stdout` pelos testes de performance.

```python
import time
import pytest

def test_performance_[NOME_DA_FUNCAO]():
    sizes = [10, 100, 1000]
    print("\n=== PERFORMANCE REPORT: [NOME_DA_FUNCAO] ===")
    print("| N (Items) | Time (ms) |")
    print("|-----------|-----------|")
    
    for n in sizes:
        dataset = [i for i in range(n)]
        
        start = time.perf_counter()
        # Chama a função de lote
        [NOME_DA_FUNCAO](dataset)
        end = time.perf_counter()
        
        elapsed_ms = (end - start) * 1000
        print(f"| {n:<9} | {elapsed_ms:<9.2f} |")
    print("============================================")
```
