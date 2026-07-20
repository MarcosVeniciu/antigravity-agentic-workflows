import time
import pytest

def test_performance_{{FUNCTION_NAME}}():
    """
    [PROFILING] Análise de Escala e Performance Big-O para {{FUNCTION_NAME}}.
    Mede a variação do tempo de execução em milissegundos conforme $N$ cresce.
    """
    # Arrange
    sizes = [10, 100, 1000]
    print("\n==================================================")
    print(f"=== PERFORMANCE REPORT: {{FUNCTION_NAME}} ===")
    print("| N (Itens)   | Tempo (ms)  |")
    print("|-------------|-------------|")
    
    for n in sizes:
        # Gerador do dataset proporcional ao N
        dataset = [i for i in range(n)]
        
        # Act
        start = time.perf_counter()
        # Invocação do stub ou função de lote
        {{MODULE_NAME}}.{{FUNCTION_NAME}}(dataset)
        end = time.perf_counter()
        
        elapsed_ms = (end - start) * 1000
        
        # Assert (Logging de performance via stdout)
        print(f"| {n:<11} | {elapsed_ms:<11.3f} |")
        
    print("==================================================")