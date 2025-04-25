#!/bin/sh

# Создаем дефолтный конфиг если его нет
if [ ! -f /etc/x-ui/config.json ]; then
    mkdir -p /etc/x-ui
    echo '{
      "port": ${XUI_PORT:-2053},
      "ssl": { "enabled": ${XUI_SSL:-false} },
      "web": {
        "username": "${XUI_USERNAME:-admin}",
        "password": "${XUI_PASSWORD:-admin}"
      }
    }' > /etc/x-ui/config.json
fi

# Запускаем панель
exec ./x-ui
