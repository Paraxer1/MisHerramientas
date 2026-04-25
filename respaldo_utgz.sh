#!/bin/bash

# =================================================================
# NOMBRE: respaldo_utgz.sh (Versión con Notificaciones)
# =================================================================

LOCAL="/home/$USER/Documentos"
REMOTO="ubuntu-utgz:Backup_Documentos"

# 1. Ejecutar la subida
rclone copy "$LOCAL" "$REMOTO" --update --transfers 4

# 2. Lógica de Notificación
# Necesitamos estas variables para que cron sepa dónde enviar la notificación
USER_ID=$(id -u)
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_ID/bus

if [ $? -eq 0 ]; then
    notify-send "☁️ Respaldo Cloud" "Sincronización de Documentos completada con éxito ✅" --icon=cloud --app-name="RClone"
else
    notify-send "⚠️ Respaldo Fallido" "Hubo un error al subir tus archivos a Drive ❌" --icon=dialog-error --app-name="RClone"
fi
