

# 🛡️ Wazuh

Wazuh est le composant principal de supervision et de détection
de la plateforme SOC mise en place dans ce laboratoire.

Il permet de centraliser les événements de sécurité provenant des
différents endpoints, de les analyser à l'aide des mécanismes natifs
de Wazuh et de générer des alertes destinées à l'investigation.

---

## 🎯 Rôle dans le projet

Dans cette plateforme SOC, Wazuh est utilisé pour :

- 🖥️ Superviser les endpoints du laboratoire
- 📥 Collecter les événements système et de sécurité
- 🔍 Analyser les événements à l'aide des règles et décodeurs Wazuh
- 🚨 Générer et centraliser les alertes de sécurité
- 🗂️ Surveiller l'intégrité des fichiers avec le FIM
- 💻 Collecter les informations système avec Syscollector
- 🔐 Identifier les vulnérabilités présentes sur les systèmes supervisés
- ⚡ Fournir des mécanismes d'Active Response
- 🔎 Transmettre les alertes vers TheHive pour leur investigation

---

## 🏗️ Composants Wazuh utilisés

La partie Wazuh du laboratoire repose sur :

| Composant | Rôle |
|---|---|
| **Wazuh Agent** | Collecte des événements sur les endpoints |
| **Wazuh Manager** | Analyse, corrélation et génération des alertes |
| **Wazuh Indexer** | Stockage et indexation des données |
| **Wazuh Dashboard** | Visualisation et analyse des événements |

Les endpoints supervisés dans le laboratoire comprennent notamment
un système Windows 10 et un système Fedora.

---

## 🔍 Détection et analyse

Wazuh utilise son ruleset natif pour analyser les événements collectés.

Le Manager s'appuie notamment sur :

- Les décodeurs Wazuh
- Les règles de détection Wazuh
- Les listes d'IOC intégrées
- Les journaux système
- Les événements de sécurité des endpoints

Les règles natives de Wazuh ont été utilisées dans le cadre de ce
laboratoire. Aucune règle de détection personnalisée n'a été ajoutée.

---

## 🗂️ File Integrity Monitoring

Le module **Syscheck / FIM (File Integrity Monitoring)** est activé
afin de surveiller les modifications effectuées sur des fichiers et
répertoires sensibles.

La configuration comprend notamment la surveillance de :

/etc
/usr/bin
/usr/sbin
/bin
/sbin
/boot
