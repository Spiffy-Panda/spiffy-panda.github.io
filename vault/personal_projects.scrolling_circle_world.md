---
id: yrcagkzlky62x63vxk6im46
title: scrolling_circle_world
desc: ''
updated: 1660164917995
created: 1660164916574
---
Language: Unity3D using Shaderlab/HLSL1

Inspiration: Indie Game "Expand" (Steam)

Goal: Explore the workflow for a game that scrolls on a disk.

Approach: Map the visuals of a side scroller to a disk via Shader.

The first half of the approach to get the visuals out put on the disk. Todo this, I first render the Scene as a typical sidescroller. Then, using Unity's Post Processing stack, I apply a shader to the whole screen.

The shader takes the given uv coordinates, centers them on zero and then translates them to polar coordinates. These new polar coordinatesare used to index into the texture resulting in the desired effect.

The game itself can just be a normal sidescroller, and needs little modification. Such modifications would be to change where the "seam" is and make mechanics aware of the screen space, such as adjust scale and controls.



C# for loading and interaction.

Unity's ShaderLab for distortion.