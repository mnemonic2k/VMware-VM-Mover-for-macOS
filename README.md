# VMware VM Mover for macOS

Dieses Bash-Skript verschiebt alle VMware Fusion-VMs von deinem lokalen Verzeichnis (`~/Documents/Virtual Machines`) auf eine externe Festplatte. Nach dem Verschieben wird automatisch ein Alias (Symlink) im ursprünglichen Ordner erstellt, damit die VMs weiterhin wie gewohnt über VMware gestartet werden können.

## 🔧 Voraussetzungen

- macOS mit installiertem VMware Fusion
- Externe Festplatte (z. B. `/Volumes/ExternePlatte`)
- Schreibrechte auf das externe Laufwerk
- Terminal-Grundkenntnisse

## 📂 Aufbau

Das Skript macht Folgendes:

1. Sucht alle `.vmwarevm`-Pakete im Standard-VM-Verzeichnis.
2. Kopiert jede VM auf die externe Festplatte.
3. Prüft, ob die Kopie erfolgreich war.
4. Löscht anschließend das Original.
5. Legt einen Alias (Symlink) zurück ins lokale Verzeichnis an.

## 🚀 Verwendung

1. Skript herunterladen oder kopieren:
   ```bash
   curl -O https://raw.githubusercontent.com/deinbenutzername/vmware-vm-mover/main/verschiebe_vmware_vms.sh
   ```

2. Ausführbar machen:
   ```bash
   chmod +x verschiebe_vmware_vms.sh
   ```

3. Ausführen:
   ```bash
   ./verschiebe_vmware_vms.sh
   ```

> ⚠️ Achtung: Das Skript löscht die Original-VMs **nach erfolgreichem Kopiervorgang**. Stelle sicher, dass dein Ziel-Laufwerk genug freien Speicher hat und keine Daten verloren gehen.

## 🛠 Konfiguration

Wenn deine VMs in einem anderen Verzeichnis liegen oder du ein anderes Zielverzeichnis nutzen willst, passe folgende Zeilen im Skript an:

```bash
SRC_DIR="$HOME/Documents/Virtual Machines"
DEST_DIR="/Volumes/ExternePlatte/VirtualMachines"
```

## 📦 Lizenz

MIT License – frei zur Verwendung, Modifikation und Weitergabe.

---

Erstellt für den privaten und professionellen Einsatz zur besseren Verwaltung von VMware Fusion-VMs unter macOS.
