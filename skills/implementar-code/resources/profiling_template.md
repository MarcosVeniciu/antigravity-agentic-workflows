import time
import pytest

def test_performance_{{FUNCTION_NAME}}():
    """Análise de Escala e Performance Big-O para {{FUNCTION_NAME}}."""
    # Arrange
    sizes = [10, 100, 1000]
    print("\n==================================================")
    print(f"=== PERFORMANCE REPORT: {{FUNCTION_NAME}} ===")
    print("| N (Itens)   | Tempo (ms)  |")
    print("|-------------|-------------|")
    
    for n in sizes:
        dataset = [i for i in range(n)]
        
        # Act
        start = time.perf_counter()
        {{MODULE_NAME}}.{{FUNCTION_NAME}}(dataset)
        end = time.perf_counter()
        
        elapsed_ms = (end - start) * 1000
        
        # Assert
        print(f"| {n:<11} | {elapsed_ms:<11.3f} |")
        
    print("==================================================")