
# 🛡️ Wazuh

Wazuh constitue le composant central de supervision et de détection
de la plateforme SOC.

## 🎯 Rôle

Dans ce laboratoire, Wazuh est utilisé pour :

- 📥 Collecter les événements des endpoints
- 🔍 Détecter les activités suspectes
- 🚨 Générer et centraliser les alertes de sécurité
- 🗂️ Surveiller l'intégrité des fichiers (FIM)
- 💻 Collecter les informations système (Syscollector)
- 🔐 Effectuer la détection des vulnérabilités
- 📊 Centraliser les événements dans le Wazuh Indexer
- 🖥️ Visualiser les événements via le Wazuh Dashboard
- 🔎 Transmettre les alertes vers TheHive pour l'investigation

## 🏗️ Architecture Wazuh

```text
Windows 10 ──┐
             │
             ├──► Wazuh Agent ──► Wazuh Manager
             │                         │
Fedora ──────┘                         │
                                       ├──► Wazuh Indexer
                                       │
                                       ├──► Wazuh Dashboard
                                       │
                                       └──► TheHive
