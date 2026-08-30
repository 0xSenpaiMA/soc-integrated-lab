# 🛡️ Open-Source SOC Platform

<p align="center">
  <img src="https://img.shields.io/badge/SOC-Open%20Source-0A66C2?style=for-the-badge" alt="SOC">
  <img src="https://img.shields.io/badge/Wazuh-4.14.7-blue?style=for-the-badge" alt="Wazuh">
  <img src="https://img.shields.io/badge/Zeek-Network%20Monitoring-orange?style=for-the-badge" alt="Zeek">
  <img src="https://img.shields.io/badge/TheHive-Incident%20Response-red?style=for-the-badge" alt="TheHive">
  <img src="https://img.shields.io/badge/MISP-Threat%20Intelligence-purple?style=for-the-badge" alt="MISP">
  <img src="https://img.shields.io/badge/Shuffle-SOAR-green?style=for-the-badge" alt="Shuffle">
</p>

<p align="center">
  <strong>Integrated Security Operations Center Laboratory</strong>
  <br>
  Detection • Investigation • Threat Intelligence • Security Automation
</p>

---

## 📌 Overview

This project presents the **design and implementation of an integrated Open-Source Security Operations Center (SOC) laboratory**.

The objective is to reproduce a complete SOC workflow by integrating several open-source cybersecurity technologies covering:

> **Monitoring → Detection → Investigation → Threat Intelligence → Automation → Response**

The laboratory is deployed in a **virtualized environment** and includes Windows and Linux endpoints, network monitoring, centralized security monitoring, incident management, threat intelligence and automated security workflows.

---

## 🎯 Project Objectives

The main objectives of this project are:

* 🔎 Centralize security events from multiple endpoints.
* 🖥️ Monitor Windows and Linux systems.
* 🚨 Detect suspicious and potentially malicious activities.
* 🌐 Provide network visibility through Zeek.
* 🧪 Investigate security incidents.
* 🧩 Analyze and enrich security observables.
* 🧠 Integrate Threat Intelligence.
* ⚙️ Automate repetitive SOC operations.
* 🔄 Implement an end-to-end incident response workflow.

---

# 🏗️ Architecture

The laboratory is composed of several virtual machines dedicated to specific security functions.

```text
                              ┌──────────────────────────┐
                              │       Kali Linux         │
                              │   Security Testing       │
                              └────────────┬─────────────┘
                                           │
                                           │ Security Activities
                                           ▼
┌──────────────────────┐          ┌──────────────────────────┐
│      Windows 10      │          │        Fedora            │
│    192.168.20.129    │          │     192.168.20.128      │
│                      │          │                          │
│   Wazuh Agent        │          │     Wazuh Agent          │
│   Sysmon             │          │     auditd               │
└──────────┬───────────┘          └────────────┬─────────────┘
           │                                   │
           │                                   │
           └───────────────┬───────────────────┘
                           │
                           ▼
              ┌──────────────────────────────┐
              │       Ubuntu Wazuh            │
              │       192.168.20.130          │
              │                               │
              │  ┌────────────────────────┐   │
              │  │    Wazuh Manager       │   │
              │  ├────────────────────────┤   │
              │  │    Wazuh Indexer       │   │
              │  ├────────────────────────┤   │
              │  │    Wazuh Dashboard     │   │
              │  └────────────────────────┘   │
              └──────────────┬───────────────┘
                             │
                             │ Alerts / Events
                             ▼
                 ┌─────────────────────────┐
                 │      SOC Platform       │
                 │ Ubuntu SOC               │
                 │ 192.168.20.131           │
                 │                         │
                 │ TheHive      :9000      │
                 │ Cortex       :9001      │
                 │ MISP         :8080      │
                 │ Shuffle      :3443      │
                 └─────────────────────────┘
                             ▲
                             │
                         ┌───┴───┐
                         │ Zeek  │
                         │Network│
                         │Monitor│
                         └───────┘
```

---

# 🔄 SOC Workflow

The implemented architecture follows a complete security monitoring and response lifecycle.

```text
┌──────────────────┐
│ Endpoint /       │
│ Network Activity │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Collection       │
│ Wazuh / Zeek     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Detection        │
│ Wazuh            │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Security Alert   │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│ Investigation    │
│ TheHive          │
└────────┬─────────┘
         │
         ├───────────────┐
         ▼               ▼
┌────────────────┐ ┌────────────────┐
│ Cortex         │ │ MISP           │
│ Analysis       │ │ Threat Intel   │
└───────┬────────┘ └───────┬────────┘
        │                  │
        └────────┬─────────┘
                 ▼
        ┌──────────────────┐
        │ Shuffle          │
        │ SOAR             │
        └────────┬─────────┘
                 │
                 ▼
        ┌──────────────────┐
        │ Automated        │
        │ Response         │
        └──────────────────┘
```

---

# 🧰 Technologies

|     Technology    | Role       | Purpose                                |
| :---------------: | :--------- | :------------------------------------- |
|    🟦 **Wazuh**   | SIEM / XDR | Monitoring, detection and alerting     |
|    🟧 **Zeek**    | NSM        | Network traffic analysis               |
|   🟥 **TheHive**  | IR         | Incident and case management           |
|   🟪 **Cortex**   | Analysis   | Observable analysis and enrichment     |
|    🟨 **MISP**    | TIP        | Threat Intelligence and IOC management |
|   🟩 **Shuffle**  | SOAR       | Security orchestration and automation  |
|   🪟 **Sysmon**   | Telemetry  | Windows activity monitoring            |
|   🐧 **auditd**   | Auditing   | Linux security auditing                |
| ⚔️ **Kali Linux** | Testing    | Controlled security testing            |

---

# 🖥️ Laboratory Infrastructure

| Machine      | IP Address       | Main Components                   |
| ------------ | ---------------- | --------------------------------- |
| Ubuntu Wazuh | `192.168.20.130` | Wazuh Manager, Indexer, Dashboard |
| Ubuntu SOC   | `192.168.20.131` | TheHive, Cortex, MISP, Shuffle    |
| Windows 10   | `192.168.20.129` | Wazuh Agent, Sysmon               |
| Fedora       | `192.168.20.128` | Wazuh Agent, auditd               |
| Kali Linux   | —                | Security testing                  |

---

# 🔌 Services & Ports

| Service |  Port  | Function            |
| ------- | :----: | ------------------- |
| TheHive | `9000` | Incident Response   |
| Cortex  | `9001` | Observable Analysis |
| MISP    | `8080` | Threat Intelligence |
| Shuffle | `3443` | SOAR / Automation   |

---

# 🛡️ Security Capabilities

### Endpoint Security

* Windows monitoring
* Linux monitoring
* Sysmon telemetry
* Linux audit events
* File Integrity Monitoring
* System inventory

### Network Security

* Network traffic monitoring
* Network security logs
* Detection of suspicious network activities
* Network visibility through Zeek

### Detection

* Centralized event collection
* Security rules
* Correlation
* Alert generation
* Suspicious activity detection

### Incident Response

* Alert investigation
* Case management
* Observable extraction
* Automated analysis
* Incident enrichment

### Threat Intelligence

* IOC management
* Threat Intelligence feeds
* Observable enrichment
* Correlation with security events

### Security Automation

* Workflow orchestration
* Automated enrichment
* Automated analysis
* Incident response automation

---

# 🧪 Validation Scenarios

The platform is validated through controlled security scenarios:

|  #  | Scenario               | Objective                       |
| :-: | ---------------------- | ------------------------------- |
|  01 | Event Collection       | Validate endpoint telemetry     |
|  02 | System Monitoring      | Validate Wazuh monitoring       |
|  03 | Suspicious Activity    | Validate detection capabilities |
|  04 | Incident Investigation | Validate TheHive                |
|  05 | Observable Analysis    | Validate Cortex                 |
|  06 | Threat Intelligence    | Validate MISP                   |
|  07 | Automation             | Validate Shuffle workflows      |

---

# 📂 Repository Structure

```text
open-source-soc-lab/
│
├── 📄 README.md
│
├── 🏗️ architecture/
│   └── architecture.png
│
├── 🛡️ wazuh/
│   ├── local_rules.xml
│   └── ossec.conf.example
│
├── 🌐 zeek/
│   └── configuration/
│
├── ⚙️ shuffle/
│   └── workflows/
│
├── 🐳 docker-compose.yml
│
└── 📚 documentation/
    └── Rapport_PFE.pdf
```

---

# 🐳 Deployment

The complementary SOC components are deployed using Docker and Docker Compose.

The Docker environment includes:

```text
TheHive
Cortex
MISP
Shuffle
```

Docker services can be checked using:

```bash
docker ps
```

or:

```bash
docker compose ps
```

---

# 🔍 Wazuh Monitoring

The Wazuh infrastructure provides centralized visibility over the laboratory endpoints.

The monitored endpoints include:

```text
Windows 10
     │
     ├── Wazuh Agent
     └── Sysmon

Fedora
     │
     ├── Wazuh Agent
     └── auditd
```

Events are transmitted to the central Wazuh Manager for analysis and detection.

---

# 🌐 Network Monitoring with Zeek

Zeek provides an additional network visibility layer within the SOC laboratory.

It generates network security logs that can be analyzed alongside endpoint telemetry to improve the visibility of security activities across the laboratory.

---

# 🚨 Incident Investigation

When a security alert is generated, the incident can be transferred to the investigation phase using **TheHive**.

The investigation process includes:

```text
Alert
  ↓
Case Creation
  ↓
Observable Extraction
  ↓
Cortex Analysis
  ↓
MISP Enrichment
  ↓
Investigation
  ↓
Response
```

---

# ⚙️ SOAR Automation

Shuffle is used to automate repetitive SOC operations.

The automation layer allows security workflows to be created for:

* Alert processing
* IOC enrichment
* Threat Intelligence lookup
* Observable analysis
* Incident notification
* Response actions

---

# 📊 SOC Lifecycle

```text
       ┌───────────────┐
       │   MONITORING  │
       └───────┬───────┘
               ↓
       ┌───────────────┐
       │   DETECTION   │
       └───────┬───────┘
               ↓
       ┌───────────────┐
       │ INVESTIGATION │
       └───────┬───────┘
               ↓
       ┌───────────────┐
       │  ENRICHMENT   │
       └───────┬───────┘
               ↓
       ┌───────────────┐
       │    RESPONSE   │
       └───────┬───────┘
               ↓
       ┌───────────────┐
       │   AUTOMATION  │
       └───────────────┘
```

---

# 📚 Documentation

The complete project documentation contains:

* Requirements analysis
* SOC architecture
* Technical study
* Implementation
* Configuration
* Testing
* Validation
* Results
* Security scenarios

📄 **Project Report:** `documentation/Rapport_PFE.pdf`

---

# 🛡️ Conception et mise en œuvre d’un laboratoire SOC intégré

### 🎓 École Nationale des Sciences Appliquées d’Agadir (ENSA Agadir)

**Projet de Fin d’Année — 2025/2026**

**Auteur :** Hamza El Bedaa  
**Formation :** Sécurité IT et Confiance Numérique  
**Encadrant professionnel :** M. Neuman Charhbili  
**Entreprise d’accueil :** Creative Internet Solutions
---

# ⚠️ Disclaimer

This laboratory is intended for **educational and cybersecurity testing purposes** in an isolated and controlled environment.

All security tests should be performed only on systems for which proper authorization has been obtained.

---

<p align="center">

### 🛡️ Integrated Open-Source SOC Laboratory

**Monitoring • Detection • Investigation • Threat Intelligence • Automation • Response**

</p>
