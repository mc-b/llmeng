# Beispiele zum Kurs: [llmeng - LLM Engineering &amp; AIOps – Übersicht und Einsatz](https://digicomp.ch/d/llmeng)

## Key Learnings

* KI-Systemarchitektur verstehen: Einordnen von LLMs in moderne IT-Infrastruktur
* Modell- & Infrastruktur-Strategie: Differenzieren zwischen Proprietary-, Open-Weight- und Open-Source-Modellen 
* Enterprise Integration: Verbinden von LLMs, RAG (Retrieval Augmented Generation) und MCP (Model Context Protocol) mit Anwendungen und Unternehmenswissen
* Skalierbare Automatisierung: Verstehen des Aufbaus von Multi-Agent-Systemen und deren Einsatz für komplexe Automatisierungsprozess

## Serverinstallation auf Bare-Metal-Hardware inkl. GPU Driver


### ubuntu-....iso Image patchen

**ubuntu-...iso Image downloaden**

z.B. von [Ubuntu Server download](https://ubuntu.com/download/server).

Abstellen, z.B. unter ~/ISO/ubuntu-24.04.4-live-server-amd64.iso

    mkdir -p ~/ISO
    cd ~/ISO
    wget https://releases.ubuntu.com/24.04.4/ubuntu-24.04.4-live-server-amd64.iso

**Tools installieren**

    sudo apt install -y xorriso
    
**Neues Autoinstall-ubuntu-24.04.4-live-server-amd64.iso bauen (Bootstruktur vom Original übernehmen)**

    git clone https://github.com/mc-b/llmeng
    cd llmeng

    rm -f ubuntu-autoinstall.iso
    
    xorriso \
      -indev ~/ISO/ubuntu-24.04.4-live-server-amd64.iso \
      -outdev ubuntu-autoinstall.iso \
      -map nocloud.k3sws /nocloud.k3sws \
      -map boot/grub/grub.cfg /boot/grub/grub.cfg \
      -boot_image any replay

Damit bleibt BIOS/UEFI-Boot wie im Original, nur `grub.cfg` und `nocloud/` werden ersetzt bzw. hinzugefügt.

**USB Stick schreiben**

    sudo dd if=ubuntu-autoinstall.iso of=/dev/sda bs=4M status=progress oflag=sync
    sync
    sudo udisksctl power-off -b /dev/sda
    
**ACHTUNG**: USB Stick Device `/dev/sda` erst durch `lsblk` ermitteln ansonsten wird der Harddisk überschrieben.

**Neu Installation erzwingen**

    sudo rm /boot/lernvirt-installed
    sudo reboot

### Lizenz (Attribution-NonCommercial-ShareAlike 4.0 International)

![](http://www.creativecommons.ch/wp-content/uploads/2014/03/by-nc-sa1.png)

Quelle [Creative Commons](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.de)

- - -

* Name muss genannt werden
* keine kommerzielle Nutzung erlaubt
* gleiche Lizenz vorgeschrieben

* Copyright (c) Marcel Bernet, Zürich
