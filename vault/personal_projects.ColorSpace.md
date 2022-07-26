---
id: tbm99i5jn49hvav54u2rbbu
title: ColorSpace
desc: ''
updated: 1658870103588
created: 1658868655081
---

#### Core Skills:
[[tags.lang.Python]][[tags.lang.C_sharp]][[tags.toolkit.notebooks]][[tags.engine.unity]]
# Color Space
![Sample Gradient Shortpaths](/assets/photo_2022-07-05_20-32-09.jpg){width: 200px}
![Sample Gradient w/long paths](/assets/photo_2022-07-06_17-46-13.jpg){width: 215px}
## Abstract
- Inspired by a post showing the differents between a sRGB lerp vs HSV lerp. I desided to explore the color space my self.
- I then port some of the code to unity so that I could use it in the future if needed. 

## Goals
- Explore ways to make gradients using different color spaces and paths. 
- Implement, in unity, CIE L\*a\*b\* and HCL or LCh which i will refer to as just LCh for Luminance-Chroma-Hue. 


## Approach
- As the objective is exploration a scripting langauge with many libraries makes a great envirement. Specificly I used a Colab Notebook[^1] for repeatablity. I found several Color tool boxes, each have their own way of doing things. 
- I implemented LCh From Lab along the way, however this may not have been nesasarry as a form of it might be in the perception tool kit with another name, (Luv).
- Implemented a "color picker" for quiter exploration. This color picker was in sRGB and two will act as the only user input as starting color and end color.
- These would first be translated these points to each color space. A straight line between the new points, than translated back to sRGB for *matplotlib.pyplot.imshow* to display.
- Added a "reflex", noted by an *r* suffix in the plots, version of the cylidener color space, this rotates the hue by $180^\circ$ so the path could go through the red hues. 
- After confirming that LCh does produce nice looking gradients, I ported the color transformations to unity. In unity I made a grid of points in sRGB, and a mesh "ribbon" between two points that is a straigh line in LCh. 
- For one last visulations, I add a slider that could change the currently rendered color space. So instead of looking at sRGB your could see the straight path in LCh, will blending along the transformation chain: $sRGB \rightarrow XYZ\rightarrow CIE\ \ La^*b^*\rightarrow LCh.$

## Results


## Conclusion

[^1]: https://colab.research.google.com/drive/1oB74E0J_cruK6b9RIyjHAGj38l4cB5RV?usp=sharing