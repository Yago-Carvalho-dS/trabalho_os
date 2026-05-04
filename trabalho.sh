#!/bin/bash

DIA=$(date +%d)
MES=$(date +%B)
ANO=$(date +%Y)
HORA=$(date +%H)
MINUTO=$(date +%M)

LINHA_ALUNO1="João victor de Carvalho"
LINHA_ALUNO2="Yago Carvalho de Souza"
LINHA_DATA="Rio de Janeiro, $DIA de $MES de $ANO"
LINHA_HORA="Hora do Sistema: $HORA Horas e $MINUTO Minutos"

while true; do
    clear
    echo "#########################################################"
    printf "# %-53s #\n" "IBMEC"
    printf "# %-53s #\n" "Sistemas Operacionais            Semestre 1 de $ANO"
    printf "# %-54s #\n" "Código: IBM8940                  Turma: 8001"
    printf "# %-53s #\n" "Professor: Luiz Fernando T. de Farias"
    echo "#-------------------------------------------------------#"
    printf "# %-53s #\n" "Equipe Desenvolvedora:"
    printf "#   %-52s #\n" "$LINHA_ALUNO1"
    printf "#   %-51s #\n" "$LINHA_ALUNO2"
    echo "#-------------------------------------------------------#"
    printf "# %-53s #\n" "$LINHA_DATA"
    printf "# %-53s #\n" "$LINHA_HORA"
    echo "#########################################################"
    echo ""
    echo "Menu de Escolhas:"
    echo "  1) Opção interativa 1 (ex: Mostrar endereço IP)"
    echo "  2) Opção interativa 2 (ex: Mostrar uso do disco)"
    echo "  3) Opção interativa 3 (ex: Listar arquivos da pasta)"
    echo "  4) Opção interativa 4 (ex: Mostrar usuários logados)"
    echo "  5) Finalizar o programa."
    echo ""
    read -p "Selecione uma opção: " opcao
    case $opcao in
        1)
            echo "Você escolheu a opção 1!"
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        2)
            echo "Você escolheu a opção 2!"
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        3)
            echo "Você escolheu a opção 3!"
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        4)
            echo "Você escolheu a opção 4!"
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        5)
            echo "Finalizando o programa. Até logo!"
            break
            ;;
        *)
            echo "Opção Inválida! Digite um número de 1 a 5."
            sleep 2
            ;;
    esac
done
