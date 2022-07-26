---
id: ffxtslhollaf2s3fihz88cq
title: IK
desc: ''
updated: 1658191076935
created: 1658183041463
tags: personal_projects.IK
---

# Inverse Kinematics or Unity's Articulated Bodies

## Abstract
- While designing a boss enemy for a game, I decided I wanted to try animating it with Inverse Kinimatics (IK). So I set about preforming a feasiblity test, something I am very familiar with from work. 

## Goal
- Investigate Posible Middle Ware
- Implement a classic multi-segment arm
- Implement a IK to point to target
- Extend it to handle different cases

## Approach

- Found out that Unity has a new physics component called *ArticulatedBody* that provides a dense *ArticulatedJacobian*. It is made for exactly this use case so bingo.
- Math background:
    - The Jacobian $J(\theta)$ is a collection of all the "first-order partial derivatives"[^1] of a function. In the context of IK, "it can provide relation between joint velocities and end effector velocities"[^2]. So for a given set joint velocities $\dot\theta$ left hand multiplication provides the task space velocites $\dot x$. This is only valid at the current state $\theta$
    - $$\dot x=J(\theta)\dot\theta$$
    - We can use $J(\theta)$'s psuedo inverse $J^+ = J^T J$ to take the error between the current and target location in task space $\mathbf{e} = \mathbf{x}_{target} - \mathbf{x}_{current}$ to joint space. This is only valid for the current state $\mathbf\theta$ and since we are using the psuedo inverse $J^+$ as an approachimation of $J^{-1}$, we only really get a direction to the goal with a magnitude can only be used as a hint. 
- A large portion of work on this project was digging into unity's *ArticulatedBody* and their...eccentricties. This is a area that is very recent and poorly documated. The example project didn't not preform Inverse Kinimatics and just mapped user inputs to direct drive.
- The actual solution was quite small I used *ArticulatedBody*'s *GetDenseJacobian*, *GetDofStartIndices* and *SetDriveTargetVelocities* only. The first to calculate the velocity to set the jointies' drive and the other two send it to all the child components at once.
- When I sat down to extend it to more joints, I found my solution just worked. Which is the advantage of this methodology opposed to one that uses more direct knowledge of the robots kinimatics. 

## Results
- The robot arm can track a target, mostly. While it can generaly move towards a point. This appoach is just simple gradient decent and has the problems of local minimum and vanishing gradient. It also is prone to oscillations were it keeps over shotting the objective.
- Next steps would be to scale the velocity better. 
    - There are ways to calcuate a scalar that minimizes the new error[^3].
    - Also, the current solution behaves like a poorly tuned PD-controllar, we could implement a tuned PID-controllar.
    - This method is ultimately just a gradient decent with one real-time state. If it is try out other optimaztion forms, that would over come the local minimum. *GetDenseJacobian* is run of the current state of the unity physics engine, so I would need to find a way to have multiple hidden states.

## Conclusion
- #TODO Write real conclusion.



- The biggest thing I learned is how incomplete/unsupported of a package unity is willing to have in listed in their core class. 
    - REQUIRES v2022.2.0b to work, which it doesn't say anywhere or use in the example project. With out it, at some point unity will give up and crash after each exit of play-in-editor.  

[^1]: Wikipedia
[^2]: Unity Scripting Reference
[^3]: http://graphics.cs.cmu.edu/nsp/course/15-464/Spring11/handouts/iksurvey.pdf