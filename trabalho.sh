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
    echo "  1) Top 5 Processos que mais consomem Memória RAM"
    echo "  2) Exibir Informações de Rede"
    echo "  3) Contar arquivos e pastas em um diretório"
    echo "  4) Consultar Previsão do Tempo"
    echo "  5) Finalizar o programa."
    echo ""
    read -p "Selecione uma opção: " opcao
    case $opcao in
        1)
            clear
            echo "[Detetive de Processos] - Top 5 Consumidores de Memória"
            echo "---------------------------------------------------------"
            ps aux --sort=-%mem | head -n 6
            echo ""
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        2)
            clear
            echo "[Informações de Rede e Conectividade]"
            echo "---------------------------------------------------------"
            echo "Aguarde, coletando dados da rede..."
            IP_LOCAL=$(hostname -I | awk '{print $1}')
            IP_PUBLICO=$(curl -s --max-time 3 ifconfig.me)
            if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
                STATUS_NET="✅ Conectado à Internet"
            else
                STATUS_NET="❌ Sem conexão com a Internet"
            fi
            echo "---------------------------------------------------------"
            echo "📡 Status       : $STATUS_NET"
            echo "🏠 IP Local     : ${IP_LOCAL:-'Não encontrado'}"
            echo "🌍 IP Público   : ${IP_PUBLICO:-'Não encontrado'}"
            echo "---------------------------------------------------------"
            echo ""
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        3)
            clear
            echo "[Contador de Arquivos e Pastas]"
            echo "---------------------------------------------------------"
            read -p "Digite o caminho do diretório (ex: /etc ou ~): " dir_alvo
            if [ -d "$dir_alvo" ]; then
                qtd_arquivos=$(find "$dir_alvo" -type f 2>/dev/null | wc -l)
                qtd_pastas=$(find "$dir_alvo" -type d 2>/dev/null | wc -l)
                qtd_pastas=$((qtd_pastas - 1))
                echo "---------------------------------------------------------"
                echo "📊 Resumo do diretório: $dir_alvo"
                echo "📄 Arquivos: $qtd_arquivos"
                echo "📁 Subdiretórios: $qtd_pastas"
            else
                echo "❌ Erro: O diretório '$dir_alvo' não existe ou você não tem permissão."
            fi
            echo "---------------------------------------------------------"
            echo ""
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        4)
            clear
            echo "Previsão do Tempo no Terminal]"
            echo "---------------------------------------------------------"
            read -p "Digite sua cidade (ou aperte ENTER para pegar local automático): " cidade
            cidade_formatada=$(echo "$cidade" | tr ' ' '+')
            curl -s "wttr.in/${cidade_formatada}?0&lang=pt"
            echo "---------------------------------------------------------"
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
