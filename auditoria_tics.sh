#!/bin/bash

{
  echo "=== AUDITORÍA DE SISTEMA - ISMAEL OLIVARES (UTGZ) ==="
  echo "Fecha: $(date)"
  echo "-----------------------------------------------------"

  echo -e "\n[1] BINARIOS DE RED Y DEVOPS (¿Están instalados?):"
  for cmd in nmap iperf3 arp-scan netdiscover bettercap fping gh terraform ansible kubectl lazygit rustdesk; do
    if command -v $cmd &> /dev/null; then
      echo "✅ $cmd: INSTALADO en $(which $cmd)"
    else
      echo "❌ $cmd: NO ENCONTRADO"
    fi
  done

  echo -e "\n[2] RESUMEN DE PAQUETES APT (Instalados manualmente):"
  comm -23 <(apt-mark showmanual | sort) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort)

  echo -e "\n[3] APLICACIONES FLATPAK:"
  flatpak list --columns=application | tail -n +1

  echo -e "\n[4] VARIABLES DE ENTORNO (PATH):"
  echo $PATH | tr ':' '\n'

} > ~/mi_sistema_completo.txt

echo "✅ Auditoría terminada. Revisa el archivo 'mi_sistema_completo.txt' en tu carpeta personal."
