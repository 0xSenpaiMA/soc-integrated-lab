# 🌐 Zeek

Zeek est le composant de **Network Security Monitoring (NSM)** utilisé
dans la plateforme SOC.

Il permet d'observer le trafic réseau, d'analyser les communications
et de générer des journaux réseau utiles à la détection, l'investigation
et au Threat Hunting.

---

## 🏗️ Architecture

~~~text
                    ┌──────────────────────┐
                    │     Trafic réseau    │
                    │                      │
                    │  Communications      │
                    │  du laboratoire      │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │         Zeek         │
                    │                      │
                    │ Network Monitoring   │
                    │ Traffic Analysis     │
                    │ Log Generation       │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │     Network Logs     │
                    │                      │
                    │ Connexions           │
                    │ DNS                  │
                    │ HTTP                 │
                    │ SSL/TLS              │
                    │ SSH                  │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      Analyse SOC     │
                    │                      │
                    │ Investigation        │
                    │ Threat Hunting       │
                    │ Detection            │
                    └──────────────────────┘
~~~

---

## 🎯 Rôle dans le projet

Zeek permet de :

- 🌐 Surveiller les communications réseau
- 📊 Générer des journaux réseau détaillés
- 🔍 Analyser les protocoles réseau
- 🧭 Identifier des comportements réseau inhabituels
- 🔎 Fournir des informations utiles à l'investigation
- 🛡️ Compléter la visibilité fournie par Wazuh

---

## 🔄 Flux de surveillance

~~~text
Trafic réseau
      │
      ▼
    Zeek
      │
      ├──► Connexions
      ├──► DNS
      ├──► HTTP
      ├──► SSL/TLS
      └──► SSH
              │
              ▼
        Network Logs
              │
              ▼
          Analyse SOC
~~~

---

## 🔗 Intégration avec Wazuh

Zeek complète la supervision des endpoints réalisée avec Wazuh.

~~~text
                  ┌─────────────────┐
                  │    Endpoints    │
                  └────────┬────────┘
                           │
                           ▼
                        Wazuh
                           │
                    Endpoint Events
                           │
                           │
Trafic réseau ──────────► Zeek
                           │
                     Network Logs
                           │
                           ▼
                   ┌───────────────┐
                   │   SOC Analyst │
                   │               │
                   │ Investigation │
                   │ Threat Hunting│
                   └───────────────┘
~~~

Wazuh fournit principalement une visibilité au niveau des systèmes
et des endpoints, tandis que Zeek fournit une visibilité au niveau
des communications réseau.

---

## 📋 Principaux journaux

| Journal | Description |
|---|---|
| `conn.log` | Informations sur les connexions réseau |
| `dns.log` | Requêtes et réponses DNS |
| `http.log` | Activité HTTP |
| `ssl.log` | Informations sur les connexions SSL/TLS |
| `ssh.log` | Activité liée au protocole SSH |

---

## 🔎 Utilisation pour l'investigation

Les données générées par Zeek peuvent être utilisées pour :

- Identifier les communications entre les machines
- Examiner les connexions vers des adresses IP externes
- Analyser les requêtes DNS
- Étudier les communications HTTP
- Identifier des comportements réseau inhabituels
- Compléter les informations provenant de Wazuh
- Faciliter les activités de Threat Hunting

---

## ⚙️ Configuration

Le dossier `configuration/` est destiné à contenir les fichiers de
configuration Zeek utilisés dans le laboratoire.

~~~text
zeek/
├── README.md
└── configuration/
~~~

---

## 🧪 Environnement

Zeek est utilisé dans un environnement de laboratoire virtualisé
afin de surveiller le trafic réseau généré entre les différents
composants de la plateforme SOC.

L'objectif est de reproduire un environnement de Network Security
Monitoring permettant d'observer et d'analyser les communications
réseau dans un contexte contrôlé.

---

## 📌 Résumé

Zeek constitue la couche de **Network Security Monitoring** de la
plateforme SOC.

Il apporte une visibilité réseau complémentaire à la visibilité
endpoint fournie par Wazuh et fournit des informations utiles à
l'analyse, l'investigation et au Threat Hunting.

---

## 📚 Documentation

Documentation officielle :

https://docs.zeek.org/
