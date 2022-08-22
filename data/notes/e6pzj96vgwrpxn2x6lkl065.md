Language: Unity3D using C#

Goal: Full 3D minimap

Approach: Uses a second camera, changing the Interpupillary distance (IPD) to shrink the world.

Unity3D's stereo camera automatically places itself at the location of the HMD. The IPD scaling and location scaling is done using Unity3D's built transform. Next, I changed the settings of the Minimap camera. Turned off the buffer clears so they render using the same Z-buffer. Then scaled the second Z-buffer by changing the near and far clipping plan to match the scale.

This works and shows up in world, while still being properly occluded. I then shift it based center of the map and location in world it.