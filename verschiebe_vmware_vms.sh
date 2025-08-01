#!/bin/bash

# Quell- und Zielverzeichnis anpassen
SRC_DIR="$HOME/Documents/Virtual Machines"
DEST_DIR="/Volumes/ExternePlatte/VirtualMachines"

# Zielverzeichnis prüfen
if [ ! -d "$DEST_DIR" ]; then
  echo "Zielverzeichnis $DEST_DIR existiert nicht. Bitte prüfe, ob die Festplatte eingehängt ist."
  exit 1
fi

# VMs suchen
VM_LIST=$(find "$SRC_DIR" -name "*.vmwarevm")

if [ -z "$VM_LIST" ]; then
  echo "Keine VMware-VMs im Quellverzeichnis gefunden."
  exit 0
fi

# Schleife über alle gefundenen VMs
for VM_PATH in $VM_LIST; do
  VM_NAME=$(basename "$VM_PATH")
  echo "Verschiebe: $VM_NAME"

  # Kopieren (zur Sicherheit erst kopieren, nicht sofort löschen)
  cp -R "$VM_PATH" "$DEST_DIR/"

  # Prüfen, ob Kopie erfolgreich war
  if [ -d "$DEST_DIR/$VM_NAME" ]; then
    echo "✅ Kopiert: $VM_NAME"

    # Original löschen
    rm -rf "$VM_PATH"
    echo "🗑️  Original gelöscht: $VM_NAME"

    # Alias anlegen (optional)
    ln -s "$DEST_DIR/$VM_NAME" "$SRC_DIR/$VM_NAME"
    echo "🔗 Alias erstellt: $SRC_DIR/$VM_NAME → $DEST_DIR/$VM_NAME"
  else
    echo "❌ Fehler beim Kopieren: $VM_NAME"
  fi

done

echo "✅ Alle VMs wurden verarbeitet."
