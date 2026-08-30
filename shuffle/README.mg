# ⚙️ Shuffle

Shuffle est le composant **SOAR (Security Orchestration, Automation and Response)** de la plateforme SOC.

Il permet d'orchestrer et d'automatiser certaines opérations de sécurité afin de réduire les tâches manuelles et de faciliter le traitement des alertes.

---

## 🏗️ Architecture

~~~text
Wazuh
  │
  │ Alertes de sécurité
  ▼
Shuffle
  │
  ├──► TheHive
  │      Gestion des incidents
  │
  ├──► Cortex
  │      Analyse des observables
  │
  └──► MISP
         Threat Intelligence
~~~

---

## 🎯 Rôle dans le projet

Shuffle assure la couche d'orchestration et d'automatisation du laboratoire SOC.

Il permet notamment de :

- Automatiser les tâches répétitives
- Orchestrer plusieurs outils de sécurité
- Traiter les alertes de manière structurée
- Enrichir les informations liées aux incidents
- Réduire les opérations manuelles
- Faciliter la réponse aux incidents

---

## 🔄 Flux d'automatisation

~~~text
Alerte Wazuh
     │
     ▼
  Shuffle
     │
     ▼
Workflow d'automatisation
     │
     ├──► Enrichissement
     ├──► Analyse
     ├──► TheHive
     ├──► Cortex
     └──► MISP
~~~

---

## 🔗 Intégration avec Wazuh

Le principe d'intégration consiste à transmettre les alertes de sécurité générées par Wazuh vers Shuffle afin de déclencher des workflows d'automatisation.

~~~text
┌─────────────────┐
│ Wazuh Manager   │
│                 │
│ Security Alert  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Shuffle     │
│     Webhook     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│     Workflow    │
└────────┬────────┘
         │
    ┌────┼────┐
    ▼    ▼    ▼
 TheHive Cortex MISP
~~~

Dans la configuration du laboratoire, l'intégration Shuffle est présente dans la configuration Wazuh sous forme commentée.

---

## 🧩 Workflows

Les workflows permettent de définir une succession d'actions automatisées déclenchées par une alerte ou un événement.

Un workflow peut suivre une logique telle que :

~~~text
Alerte
  │
  ▼
Trigger
  │
  ▼
Extraction des observables
  │
  ▼
Enrichissement
  │
  ▼
Analyse
  │
  ▼
Création / traitement de l'incident
  │
  ▼
Intervention de l'analyste
~~~

Les workflows exportés peuvent être placés dans le dossier `workflows/`.

---

## 🐳 Déploiement

Shuffle est déployé dans l'environnement de laboratoire à l'aide de Docker et Docker Compose.

La configuration Docker Compose utilisée pour le laboratoire se trouve à la racine du dépôt.

---

## 🔐 Sécurité

Les informations sensibles ne doivent pas être publiées dans le dépôt GitHub.

Il faut notamment éviter de publier :

- API Keys
- Tokens
- Credentials
- Webhook URLs privées
- Secrets

Les valeurs sensibles doivent être remplacées par des placeholders avant la publication.

---

## 📂 Structure

~~~text
shuffle/
├── README.md
└── workflows/
~~~

---

## 📌 Résumé

Shuffle constitue la couche **SOAR** de la plateforme SOC.

Il permet d'orchestrer les différents composants de sécurité et d'automatiser certaines étapes du traitement des alertes.

Son intégration avec Wazuh, TheHive, Cortex et MISP permet de construire un processus de traitement des incidents plus structuré et plus automatisé.

---

## 📚 Documentation

Documentation officielle :

https://shuffler.io/
