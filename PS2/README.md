# Problem Statement 2 – System Monitoring & App Health Checks

## 🧩 Overview
This directory contains two production-grade Bash scripts built to monitor:

- **System performance metrics**  
- **Application uptime & HTTP status**  

Both scripts include logging, timestamping, safe error handling, and configurable intervals.

---

## 🖥️ 1. `system_monitor.sh`
A system monitoring script that logs:

- CPU usage  
- Memory consumption  
- Disk utilization  
- Network throughput  
- System load  

### **Run**
```bash
chmod +x system_monitor.sh
./system_monitor.sh
```

### **Log Output**
Automatically saved to:
```
system_health.log
```

---

## 🌐 2. `app_health_check.sh`
Monitors an application endpoint with retries and HTTP status capturing.

### **Run**
```bash
chmod +x app_health_check.sh
./app_health_check.sh https://your-app.com
```

### **Features**
- timestamps  
- retry loop  
- HTTP code logging  
- logs saved to:
```
app_health.log
```

---

## 📁 Logs (Generated)
```
system_health.log
app_health.log
```

---

## 📌 Notes
These scripts were used during CI/CD and during Kubernetes troubleshooting to validate pod uptime & resource performance.

---

## © Author
**Somnath Damale**
https://github.com/i-damale
