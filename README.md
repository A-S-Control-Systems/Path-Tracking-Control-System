<div align="center">
  
# Path-Tracking-Control-System
</div>

## Overview
The core of this project is a control system that ensures an autonomous vehicle remains on its designated path. The approach is built on two primary components:
- ### Kinematic Model:
The system uses a kinematic model that represents the vehicle's motion based on its geometry, rather than forces or torques. This model is valid for low-speed motion, large path curvature, and when inclination and bank angles are negligible. It simplifies the vehicle to a bicycle model, where the front and rear wheel pairs are each represented by a single central wheel.


- ### Control Strategy:
The project proposes a control strategy that combines two methods to handle path-following errors.

1- Orientation Error Handling: This method uses a geometric procedure to relate the steering angle to the orientation error. The goal is to align the vehicle's velocity vector with the tangent of the desired path.

2- Cross-Track Error (CTE) Handling: This method uses a Proportional-Integral-Derivative (PID) controller to modify the steering angle based on the CTE, which is the distance between the vehicle's center of gravity and the path. This action rotates the vehicle's velocity vector toward the path's centerline.


By combining these two methods, the system overcomes the individual limitations of each approach, such as following a parallel path or moving in the wrong direction when starting far from the desired course

## Simulation and Results
The control system was simulated using the Matlab and Simulink environments. This simulation allows for the real-time testing of the control methods and visualization of the vehicle's motion.
The simulation environment is structured with the following blocks:

### Road Block:
This block contains the mathematical formula for the road, providing the vehicle's X-coordinate and the corresponding road's Y-coordinate and slope.


### Sensors Block: 
This block calculates the orientation error and CTE based on the vehicle's current position and the road's mathematical expression.

### Controller Block:
Here, the combined control strategy is implemented. It applies a PID controller to the CTE and adds the orientation error to determine the required slip angle. This is then used to calculate the necessary steering angle.

### Kinematic Model Block:
This block simulates the vehicle's motion using the lateral kinematic equations, updating the vehicle's X and Y coordinates and its orientation at each instant.

The simulation results confirm that the combined control method effectively tracks the path, solving the problems faced by the individual orientation-based and CTE-based controllers.
