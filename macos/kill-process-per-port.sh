#!/bin/bash

PORT=$1

if [ -z "$PORT" ]; then
  echo "Informe a porta como argumento."
  exit 1
fi

# Encontra o PID do processo rodando na porta
PID=$(lsof -ti :$PORT)

if [ -n "$PID" ]; then
  echo "Matando processo na porta $PORT (PID: $PID)..."
  kill -9 $PID
  echo "Processo finalizado com sucesso!"
else
  echo "Nenhum processo encontrado rodando na porta $PORT."
fi
