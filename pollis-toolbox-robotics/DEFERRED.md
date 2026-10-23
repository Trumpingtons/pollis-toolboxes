# Robotics Toolbox: deferred (2026-10-23)

Kept for a future development. Not ready to publish:

- RobotDynamics 0.4.8 does not precompile on Julia 1.13 (its src/utils.jl redefines
  LinearAlgebra.LAPACK.getrf!, which Julia 1.13 already defines), so RobotZoo fails to load too.
- The code examples call functions that do not exist (RobotDynamics inverse_dynamics,
  gravity_compensation; undefined ee_body, path, mvis, compute_transform), rzoo uses
  Pendulum(length=...) instead of len=, and traj-opt needs TrajectoryOptimization/Altro.

Plan when resumed: Robot Dynamics, Robot Control and MeshCat on RigidBodyDynamics 2.5,
MeshCat 1.1 and MeshCatMechanisms 0.10 (all load cleanly on 1.13.1), with a small URDF written
in each example; the Robot Model Library with hand-written pendulum, cart-pole, bicycle and
quadrotor dynamics, or RobotZoo once RobotDynamics is fixed upstream.

The panels were removed from Pollis (move mode); this folder holds them. Remove this file before
publishing.
