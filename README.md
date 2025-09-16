<div align="center">
  
# Path-Tracking-Control-System
</div>

## 📖 Overview & Methodology
The core of this project is a control system that ensures an autonomous vehicle remains on its designated path. The work is built on two primary stages:
- ### Kinematic Model Extraction:
The system uses a kinematic model that represents the vehicle's motion based on its geometry, rather than forces or torques. This model is valid for low-speed motion, large path curvature, and when inclination and bank angles are negligible. It simplifies the vehicle to a bicycle model, where the front and rear wheel pairs are each represented by a single central wheel.

<div align="center">

<img width="500" height="500" alt="bicycle model" src="https://github.com/user-attachments/assets/9e18656d-acf9-4d74-85b5-1f0a1ad42fb9" />
</div>

- ### Control Strategy:
The project proposes a control strategy that combines two methods to handle path-following errors.

1- Orientation Error Handling: This method uses a geometric procedure to relate the steering angle to the orientation error. The goal is to align the vehicle's velocity vector with the tangent of the desired path.

2- Cross-Track Error (CTE) Handling: This method uses a Proportional-Integral-Derivative (PID) controller to modify the steering angle based on the CTE, which is the distance between the vehicle's center of gravity and the path. This action rotates the vehicle's velocity vector toward the path's centerline.


By combining these two methods, the system overcomes the individual limitations of each approach, such as following a parallel path or moving in the wrong direction when starting far from the desired course.
The following figure shows the control scheme used for path tracking.
<div align="center">
  
<img width="500" height="500" alt="q" src="https://github.com/user-attachments/assets/a30dd64a-bad1-464c-8c2e-aa15a788eb6b" />
</div>


## Simulation and Results
The control system was simulated using the Matlab and Simulink environments. This simulation allows for the real-time testing of the control methods and visualization of the vehicle's motion.
The simulation environment is structured with the following blocks:
<div align="center">

<img width="700" height="400" alt="e" src="https://github.com/user-attachments/assets/5af1314c-e4d6-4e4a-a620-835130089b4c" />
</div>

### Road Block:
This block contains the mathematical formula for the road, providing the vehicle's X-coordinate and the corresponding road's Y-coordinate and slope.


### Sensors Block: 
This block calculates the orientation error and CTE based on the vehicle's current position and the road's mathematical expression.

### Controller Block:
Here, the combined control strategy is implemented. It applies a PID controller to the CTE and adds the orientation error (with gain) to determine the required slip angle. This is then used to calculate the necessary steering angle.

### Kinematic Model Block:
This block simulates the vehicle's motion using the lateral kinematic equations, updating the vehicle's X and Y coordinates and its orientation at each instant.

The simulation results confirm that the combined control method effectively tracks the path, solving the problems faced by the individual orientation-based and CTE-based controllers.
Table below shows how the simulated car trackes the predefined path (exponential path, straigh line path, cosine path )
<div align="center">
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/57a3fa52-b401-4347-9152-9a6476a7a7c9" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/c6b92ae0-beea-46e0-ad5e-61b8804ccf02" width="250"/></td>
    <td><img src="https://github.com/user-attachments/assets/73fcc5b5-4415-4517-bcf0-6a779a38b993" width="250"/></td>
  </tr>
</table>
</div>

## 🚀 Quick Start

### Prerequisites
- OS/Tooling: `MATLAB 2014a+`

### Installation & Usage
# Clone repository
git clone https://github.com/A-S-Control-Systems/Path-Tracking-Control-System
from the [src](https://github.com/A-S-Control-Systems/Path-Tracking-Control-System/tree/main/src) , run play_me_first.m to initialize the car parameters and define the path to be tracked (you can edit it as wanted), then run the code main.m which automatically run the Kinematic_Model_Delta_Psi_Control.slx to calculate the traversed path, then it simulates it using drawnow.

## 📊 Results & Benchmarks
- The combined control method of using a geometric approach for orientation error and a PID controller for cross-track error (CTE) solves the problems faced by each individual method.


- The orientation-error-based controller alone fails when the vehicle is not close to the path, causing it to follow a path parallel to the desired one instead of converging.
- The CTE-based controller alone can cause the vehicle to move in the opposite direction of the desired path if its initial position is too far from the road.
- The combined method prevents the vehicle from being driven in an opposite direction and ensures it moves toward the path.
- The Matlab Simulink simulation demonstrates that the integrated control strategy achieves acceptable results in path tracking.
- Simulation results for the combined approach show that both orientation error and cross-track error converge and remain small over time
## 📂 Project Structure
```
├ src contains MATLAB codes
│   ├── play_me_first.m          #initializes the car parameters and defines the path tobe tracked
│   ├── Kinematic_Model_Delta_Psi_Control.slx       # Simulink file that applies the control scheme to track the path
│   ├── main.m          # runs the simulation after calling the simulink file
├ Documentation       # Training data & code
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
