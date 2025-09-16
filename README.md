<div align="center">

# 🚗 Path Tracking Control System

![MATLAB](https://img.shields.io/badge/MATLAB-v2014a%2B-blue?style=flat-square&logo=Mathworks)
![Simulink](https://img.shields.io/badge/Simulink-Autonomous%20Control-orange?style=flat-square&logo=Mathworks)
![Status](https://img.shields.io/badge/Status-Simulation%20Validated-success?style=flat-square)

</div>

---

## 📖 Overview & Methodology
This project implements a **path tracking control system** that ensures an autonomous vehicle follows a predefined trajectory. The work is structured in two main stages:

### 🔹 Kinematic Model Extraction
- The vehicle is modeled using a **bicycle kinematic model**, valid for:
  - Low-speed motion  
  - Large curvature paths  
  - Negligible bank and inclination angles  
- The bicycle abstraction represents each axle (front and rear) by a single wheel located at its midpoint.  

<div align="center">
<img width="500" alt="bicycle model" src="https://github.com/user-attachments/assets/9e18656d-acf9-4d74-85b5-1f0a1ad42fb9" />
</div>

### 🔹 Control Strategy
The proposed control scheme combines two methods:

1. **Orientation Error Handling**  
   - A geometric procedure relates steering angle to orientation error.  
   - Aligns the velocity vector with the tangent of the reference path.  

2. **Cross-Track Error (CTE) Handling**  
   - A PID controller adjusts the steering angle based on the lateral deviation (CTE).  
   - Ensures the velocity vector rotates toward the path centerline.  

👉 By combining both, the system avoids the limitations of each method individually (parallel tracking, divergence, or wrong direction).  

<div align="center">
<img width="500" alt="control scheme" src="https://github.com/user-attachments/assets/a30dd64a-bad1-464c-8c2e-aa15a788eb6b" />
</div>

---

## 🖥️ Simulation Environment
The system is implemented and tested in **MATLAB & Simulink**.  

The simulation includes the following blocks:

- **Road Block**: Defines the mathematical expression of the path.  
- **Sensors Block**: Computes orientation error and cross-track error.  
- **Controller Block**: Combines PID (for CTE) + geometric approach (for orientation).  
- **Kinematic Model Block**: Updates vehicle pose using lateral kinematic equations.  

<div align="center">
<img width="700" alt="simulation structure" src="https://github.com/user-attachments/assets/5af1314c-e4d6-4e4a-a620-835130089b4c" />
</div>

---

## 📊 Simulation Results
The combined controller demonstrates robust path tracking on different reference paths:

<div align="center">
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/57a3fa52-b401-4347-9152-9a6476a7a7c9" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/c6b92ae0-beea-46e0-ad5e-61b8804ccf02" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/73fcc5b5-4415-4517-bcf0-6a779a38b993" width="250"/></td>
  </tr>
</table>
</div>

Key findings:
- The **orientation-only controller** may cause parallel tracking without convergence.  
- The **CTE-only controller** can lead to divergence if the vehicle starts far from the path.  
- The **combined method** ensures convergence and prevents opposite-direction tracking.  
- Both orientation error and cross-track error converge and remain small over time.  

---

## 🚀 Quick Start

### 🔧 Prerequisites
- MATLAB **2014a or newer** (with Simulink)

### 📂 Installation & Usage
```bash
# Clone the repository
git clone https://github.com/A-S-Control-Systems/Path-Tracking-Control-System
```
from the [src](https://github.com/A-S-Control-Systems/Path-Tracking-Control-System/tree/main/src) , run play_me_first.m to initialize the car parameters and define the path to be tracked (you can edit it as you want), then run the code main.m which automatically run the Kinematic_Model_Delta_Psi_Control.slx to calculate the traversed path, then it simulates it using drawnow.
## 📂 Project Structure

```
├ src  #contains MATLAB codes
│   ├── play_me_first.m           # Initializes car parameters & defines path
│   ├── Kinematic_Model_Delta_Psi_Control.slx       # Simulink model with control scheme
│   ├── main.m          # Runs the simulation & visualization
├ Documentation       # Documentation file (PDF)
├ README.md

```

## 📖 Citation

```
@software{myproject2025,
  author    = {Ali Deeb and Saleh Rabea},
  title     = {Path-Tracking-Control-System},
  year      = {2023},
  publisher = {GitHub},
  note      = {Supervised by Dr. Hasan Alahmad, Dr. Samer Suleiman, Eng. Wassim Ahmad},
  url       = {https://github.com/A-S-Control-Systems/Path-Tracking-Control-System}
}
