#!/bin/bash

echo "🛠️ Rematando la instalación en el SSD de 1TB..."

# 1. INSTALAR BINARIOS DE RED (Los que faltan en tu auditoría)
echo "🌐 Instalando herramientas de Capa 2 y escaneo..."
sudo apt update
sudo apt install -y arp-scan netdiscover fping bettercap

# 2. RE-INSTALAR FLATPAKS (Slack, Zoom y Compass no aparecen en tu lista)
echo "📦 Asegurando aplicaciones Flatpak..."
flatpak install flathub com.slack.Slack -y
flatpak install flathub us.zoom.Zoom -y
flatpak install flathub com.mongodb.Compass -y

# 3. PERMISOS ESPECIALES
# Para que arp-scan y fping funcionen mejor sin pedir sudo a cada rato
sudo setcap cap_net_raw,cap_net_admin=eip $(which arp-scan)
sudo setcap cap_net_raw,cap_net_admin=eip $(which fping)

echo "✅ ¡Remate completado! Ejecuta la auditoría una última vez para confirmar."
