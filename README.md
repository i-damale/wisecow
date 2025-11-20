# Wisecow – Containerized Application with CI/CD, K3s Deployment & Observability

## 🚀 Overview
Wisecow is a lightweight containerized web application designed as a complete DevOps hands‑on project.  
This repository demonstrates:

- Docker image packaging  
- Multi-version CI/CD workflow (v1 → v5)  
- Kubernetes deployment manifests  
- K3s deployment inside GitHub Actions  
- Secure HTTPS ingress  
- System monitoring + application health checks (PS2)  
- Clean, well‑documented project structure  

All components are production‑ready and can run locally or inside automated pipelines.

---

## 📦 Features
- **Dockerized application** with multi-tag build (`latest`, `v1`)
- **Automated CI/CD pipeline** with GitHub Actions
- **Ephemeral K3s clusters** powered by k3d during CI
- **HTTPS ingress** with self-signed TLS
- **System monitoring scripts** (CPU, RAM, Disk, Network)
- **Application health checks** with logging and retries
- **Organized folder structure** for easy navigation

---

## 📁 Repository Structure
```
wisecow/
│
├── Dockerfile
├── deployment.yaml
├── service.yaml
├── ingress.yaml
├── kind-config.yaml
├── README.md   ← (this file)
│
├── PS2/
│   ├── system_monitor.sh
│   ├── app_health_check.sh
│   └── README.md
│
└── .github/workflows/
    └── docker-ci.yml   ← CI/CD pipeline
```

---

## 🧱 CI/CD Pipeline Versions (v1 → v5)

### **v1 – Basic Docker Build**
- Build image  
- Push to Docker Hub

### **v2 – Added KinD + Nginx ingress**
- First Kubernetes-based deploy attempt  
- HTTPS mostly unreliable due to ingress readiness delays

### **v3 – Improved ingress stability**
- Increased timeouts  
- Still unstable on GitHub runners

### **v4 – Custom KinD config**
- Mapped host ports  
- Defined cluster pod subnet  
- Slight improvement but ingress still flaky

### **v5 – Final Stable Version (Current)**
- 🚀 Switched from KinD → **K3s via k3d**
- Traefik ingress built-in → no manual installation  
- TLS secret auto-created  
- 99% stable HTTPS test on GitHub Actions  

This version is the one currently used in `.github/workflows/docker-ci.yml`.

---

## 🔧 Local Development

### **1. Run Wisecow locally**
```bash
docker build -t wisecow .
docker run -p 4499:4499 wisecow
```

### **2. Deploy on Minikube**
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml
```

---

## 🔐 Security
A minimal Zero Trust policy is included (optional) in `/policies/`.

---

## 📝 Screenshots
*(To be added manually for submission)*

---

## 📣 Author
**Somnath Damale (i-damale)**  
Freelancer | DevOps Enthusiast | Cloud & Automation
https://github.com/i-damale
---

## ⭐ Contributions
PRs and suggestions are welcome!  
If this helped you, consider giving the repo a **star ⭐**!
