<div align="center">
  
# Path-Tracking-Control-System
</div>

## Overview
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
