#!/bin/sh

# Start fail2ban
[ $X_UI_ENABLE_FAIL2BAN == "true" ] && fail2ban-client -x start
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

# Run x-ui
exec /app/x-ui
