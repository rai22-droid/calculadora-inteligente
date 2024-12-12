
calculadora.sh

#!/bin/bash

# Verifica se o interpretador Python está instalado
if ! command -v python3 &> /dev/null
then
    echo "Python3 não encontrado. Por favor, instale-o para usar a calculadora."
    exit
fi

# Código Python da calculadora em um script temporário
cat << 'EOF' > calculadora.py
def calculadora():
    while True:
        print("Bem Vindo á Calculadora Inteligente!")
        print("Escolha Uma Operação")
        print("1. Adição (+)")
        print("2. Subtração (-)")
        print("3. Multiplicação (*)")
        print("4. Divisão (/)")
        print("5. Sair")

        operacao = input("Digite o número da operação desejada:")

        if operacao == '5':
            print("Saindo Da Calculadora. Até Mais, volte sempre que precisar de uma ajudinha!")
            break

        if operacao in ["1", "2", "3", "4"]:
            try:
                num1 = float(input("Digite o primeiro número:"))
                num2 = float(input("Digite o segundo número"))

                if operacao == '1':
                    resultado = num1 + num2
                    print(f"{num1} + {num2} = {resultado}")
                elif operacao == '2':
                    resultado = num1 - num2
                    print(f"{num1} - {num2} = {resultado}")
                elif operacao == '3':
                    resultado = num1 * num2
                    print(f"{num1} * {num2} = {resultado}")
                elif operacao == '4':
                    if num2 != 0:
                        resultado = num1 / num2
                        print(f"{num1} / {num2} = {resultado}")
                    else:
                        print("Erro: Divisão por zero não é permitida.")
            except ValueError:
                print("Erro: Insira um número válido.")
        else:
            print("Erro: Operação Inválida. Tente Novamente.")

if __name__ == "__main__":
    calculadora()
EOF

# Executa o script Python
python3 calculadora.py


# Remove o script temporário
rm calculadora.py

