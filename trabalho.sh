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
    echo "  1) Simular Backup e Restauração (tar)"
    echo "  2) Auditor de Permissões (Segurança)"
    echo "  3) Contar arquivos e pastas em um diretório"
    echo "  4) Gerenciador de Processos (Finalizar Tarefa)"
    echo "  5) Finalizar o programa."
    echo ""
    read -p "Selecione uma opção: " opcao
    case $opcao in
        1)
            clear
            echo "[Simulação de Backup e Restauração]"
            echo "---------------------------------------------------------"
            DIR_LAB="lab_backup_$(date +%s)"
            echo "1. Criando diretório de teste: $DIR_LAB"
            mkdir "$DIR_LAB"
            echo "2. Criando arquivos de texto..."
            echo "Conteúdo do arquivo 1" > "$DIR_LAB/doc1.txt"
            echo "Conteúdo do arquivo 2" > "$DIR_LAB/doc2.txt"
            ls -l "$DIR_LAB"
            echo ""
            echo "3. Compactando arquivos com 'tar'..."
            tar -cvf backup_lab.tar "$DIR_LAB"
            echo "✅ Backup 'backup_lab.tar' criado com sucesso."
            echo ""
            echo "4. Deletando o diretório original..."
            rm -rf "$DIR_LAB"
            echo "❓ Verificando: O diretório existe? $([ -d "$DIR_LAB" ] && echo "Sim" || echo "Não")"
            echo ""
            read -p "Pressione ENTER para restaurar do backup..."
            echo ""
            echo "5. Restaurando arquivos..."
            tar -xvf backup_lab.tar
            echo "Concluída."
            ls -l "$DIR_LAB"
            rm -f backup_lab.tar
            rm -rf "$DIR_LAB"
            echo "---------------------------------------------------------"
            echo ""
            read -p "Pressione ENTER para voltar ao menu..."
            ;;
        2)
            clear
            echo "[Auditor de Permissões de Segurança]"
            echo "---------------------------------------------------------"
            read -p "Digite o caminho de um arquivo ou pasta para auditar: " alvo
            if [ -e "$alvo" ]; then
                perms=$(stat -c "%a" "$alvo")
                echo "Permissões atuais: $perms"
                if [ "$perms" -eq 777 ]; then
                    echo "⚠️ste item tem permissões totais (777) Altamente inseguro."
                    read -p "Deseja corrigir para 755 (diretório) ou 644 (arquivo)? (s/n): " fix
                    if [ "$fix" == "s" ]; then
                        if [ -d "$alvo" ]; then
                            chmod 755 "$alvo"
                        else
                            chmod 644 "$alvo"
                        fi
                        echo "✅ Permissões ajustadas."
                    fi
                else
                    echo "✅ As permissões parecem seguras."
                fi
            else
                echo "❌ Erro: Arquivo ou diretório não encontrado."
            fi
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
            echo "[Gerenciador de Processos]"
            echo "---------------------------------------------------------"
            echo "Top 10 processos por CPU:"
            ps aux --sort=-%cpu | head -n 11
            echo "---------------------------------------------------------"
            read -p "Deseja finalizar algum processo? Digite o PID ou pressione ENTER para sair: " pid_kill
            if [ ! -z "$pid_kill" ]; then
                if kill -0 "$pid_kill" 2>/dev/null; then
                    kill "$pid_kill"
                    echo "✅ Sinal enviado para o processo $pid_kill."
                else
                    echo "❌ Erro: PID $pid_kill inválido ou você não tem permissão."
                fi
            fi
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
