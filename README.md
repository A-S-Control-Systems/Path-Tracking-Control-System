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
