---
id: 0gmr4ome7gf2gzyyuq2f7xl
title: Panda's Portfolio
desc: ''
updated: 1660171481962
created: 1658781951452
---

# [[Inverse Kinematics|personal_projects.IK]]
#### Core Skills:
[[tags.lang.C_sharp]][[tags.engine.unity]][[tags.robotics]][[tags.3d_mathematics]]

Instead of starting with a set of rotations and offsets to obtain an end position from base. Inverse Kinematics starts with an end position and set of constraints and calculates the rotations and offsets that solve them. 

My approach uses unity's *ArticulatedBody* and it's Jacobian to preform a gradient decent. 

 
# [[personal_projects.ColorSpace]]
#### Core Skills:
[[tags.lang.Python]][[tags.lang.C_sharp]][[tags.toolkit.notebooks]][[tags.engine.unity]]

Simple Gradients are often made by *lerp* from one color to another. This is dependent on the color space, *sRGB* will produce different gradients then *HSV*. 

In this project I try out different color spaces, *HSV*, *sRGB*, *XYZ*, *Lab* and *Lch*. 

# [[personal_projects.QOI_ImageFormat]]
#### Core Skills:
[[tags.tech_reading]][[tags.lang.C_sharp]][[tags.engine.unity]]

PNG the one of the most widely used lossless image compression. In order to compress and decompress images, it uses a large number of different chunk types and calculates are a variety of metrics. As a result, PNG are slow and ram intensive to encode. QoI, is a proposed image format from Dominic Szablewski, that is meant to be quick and light instead. QoI's specification is also just 1 page, compared to PNG's 96 pages.

I was interested in checking out this lossless image compression. In the passed I bit-banged out *BMP*s and studied *JPEG* in computation mathematics. I chose unity, thinking in the future it might be nice to use this in a larger project. 

### Older Projects

# [[personal_projects.VR_Minimap]] and [[personal_projects.AR_Minimap]]
Full 3D minimap using a second camera, changing the Interpupillary distance (IPD) to "shrink" the world. Followed up by a project to make the construction viewable in AR.

# [[personal_projects.scrolling_circle_world]]
Exploring the workflow for a game that scrolls on a disk.