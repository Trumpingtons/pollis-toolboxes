# Robotics Toolbox

Pollis Robotics Toolbox: rotations, rigid-body kinematics and dynamics, robot control (inverse kinematics, PD joint control, computed torque, impedance control), 3D visualisation with MeshCat and the RobotZoo model library.

Installing it adds the **Robotics Toolbox** submenu to the end of the **Extend** menu; its **Edit** button in the Installed section of the Extensions pane moves it, or any of its panels, to another menu. Each panel has key points, a decision table, example code, Next Steps, wikis and notebook tutorials.

## Panels

| Panel | What it covers | Powered by |
|---|---|---|
| Robot Dynamics | Rotation representations (rotation matrices, quaternions, Euler angles) and their conversions, forward kinematics, forward dynamics by the articulated-body algorithm and inverse dynamics by recursive Newton-Euler | [Rotations.jl](https://github.com/JuliaGeometry/Rotations.jl), [RobotDynamics.jl](https://github.com/RoboticExplorationLab/RobotDynamics.jl), [RigidBodyDynamics.jl](https://github.com/JuliaRobotics/RigidBodyDynamics.jl) |
| Robot Control | Inverse kinematics, PD joint control, computed-torque control and impedance control of rigid-body robots | [RobotDynamics.jl](https://github.com/RoboticExplorationLab/RobotDynamics.jl), [RigidBodyDynamics.jl](https://github.com/JuliaRobotics/RigidBodyDynamics.jl) |
| MeshCat 3D Visualisation | 3D scenes in the browser: setting up a scene, animating trajectories, showing coordinate frames and loading a URDF robot | [MeshCat.jl](https://github.com/rdeits/MeshCat.jl), [CoordinateTransformations.jl](https://github.com/JuliaGeometry/CoordinateTransformations.jl) |
| Robot Model Library | Ready-made models: the pendulum, the cart-pole, the bicycle model and the quadrotor, their states, controls and dynamics | [RobotZoo.jl](https://github.com/RoboticExplorationLab/RobotZoo.jl), [RobotDynamics.jl](https://github.com/RoboticExplorationLab/RobotDynamics.jl) |

## Requirements

Julia. Each panel lists the Julia packages it uses on its Powered by line and offers to install the missing ones.

## License

AGPL-3.0
