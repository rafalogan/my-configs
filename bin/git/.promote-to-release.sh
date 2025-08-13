#!/bin/bash

# Nome da branch atual
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Prefixos válidos
valid_prefixes=("feature/" "bugfix/" "hotfix/" "fix/")

# Verifica se a branch atual começa com algum prefixo permitido
matched_prefix=""
for prefix in "${valid_prefixes[@]}"; do
	if [[ "$current_branch" == "$prefix"* ]]; then
		matched_prefix="$prefix"
		break
	fi
done

# Se não encontrar um prefixo válido, aborta
if [[ -z "$matched_prefix" ]]; then
	echo "❌ A branch atual não pode ser promovida. Deve começar com: ${valid_prefixes[*]}"
	echo "📌 Branch atual: $current_branch"
	exit 1
fi

# Pega apenas o sufixo (nome da branch)
suffix="${current_branch#$matched_prefix}"
new_branch="release/$suffix"

# Renomeia localmente
git branch -m "$new_branch"
echo "✅ Branch renomeada localmente para: $new_branch"

# Faz push da nova branch
git push origin -u "$new_branch"
echo "☁️  Nova branch publicada no remoto: $new_branch"

# Deleta a branch antiga do remoto
git push origin --delete "$current_branch"
echo "🧹 Branch remota antiga '$current_branch' deletada."
