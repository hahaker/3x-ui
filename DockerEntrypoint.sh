#!/bin/sh

# Start fail2ban
[ $X_UI_ENABLE_FAIL2BAN == "true" ] && fail2ban-client -x start
sed -i "s/\"port\":.*,/\"port\": ${XUI_PORT:-2053},/g" /etc/x-ui/config.json
sed -i "s/\"enabled\":.*,/\"enabled\": ${XUI_SSL:-false},/g" /etc/x-ui/config.json
sed -i "s/\"username\":.*,/\"username\": \"${XUI_USERNAME:-admin}\",/g" /etc/x-ui/config.json
sed -i "s/\"password\":.*,/\"password\": \"${XUI_PASSWORD}\"/g" /etc/x-ui/config.json
# Run x-ui
exec /app/x-ui
