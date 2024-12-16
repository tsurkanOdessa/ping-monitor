#!/bin/bash

HOST="8.8.8.8"

COUNT=0
FAIL_COUNT=0

TIMEOUT=1

while true; do

  ping -c 1 -W $TIMEOUT $HOST > /dev/null

  if [ $? -eq 0 ]; then
    echo "Пинг успешен."
    FAIL_COUNT=0
  else
    echo "Пинг не удался."
    ((FAIL_COUNT++))

    if [ $FAIL_COUNT -ge 3 ]; then
      echo "Неудачные 3 попытки подряд! Выход!"
      break
    fi
  fi

  # Интервал 1 секунда между пингами
  sleep 1
done

