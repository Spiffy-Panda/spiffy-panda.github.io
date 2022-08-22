
#### Core Skills:
[[tags.lang.Python]][[tags.lang.C_sharp]][[tags.toolkit.notebooks]][[tags.engine.unity]]

![Sample Gradient Short Paths](/assets/photo_2022-07-05_20-32-09.jpg){width: 200px}
![Sample Gradient w/long paths](/assets/photo_2022-07-06_17-46-13.jpg){width: 215px}
## Abstract
- Inspired by a post showing the different between a sRGB lerp vs HSV lerp. I decided to explore the color space my self.
- I then port some of the code to unity so that I could use it in the future if needed. 

## Goals
- Explore ways to make gradients using different color spaces and paths. 
- Implement, in unity, CIE L\*a\*b\* and HCL or LCh which i will refer to as just LCh for Luminance-Chroma-Hue. 


## Approach
- As the objective is exploration a scripting language with many libraries makes a great environment. Specifically I used a Colab Notebook[^1] for repeatability. I found several Color tool boxes, each have their own way of doing things. 
- I implemented LCh From Lab along the way, however this may not have been necessarily as a form of it might be in the perception tool kit with another name, (Luv).
- Implemented a "color picker" for quicker exploration. This color picker was in sRGB and two will act as the only user input as starting color and end color.
- These would first be translated these points to each color space. A straight line between the new points, than translated back to sRGB for *matplotlib.pyplot.imshow* to display.
- Added a "reflex", noted by an *r* suffix in the plots, version of the cylinder color space, this rotates the hue by $180^\circ$ so the path could go through the red hues. 
- After confirming that LCh does produce nice looking gradients, I ported the color transformations to unity. In unity I made a grid of points in sRGB, and a mesh "ribbon" between two points that is a straight line in LCh. 
- For one last visualizations, I add a slider that could change the currently rendered color space. So instead of looking at sRGB your could see the straight path in LCh, will blending along the transformation chain: $sRGB \rightarrow XYZ\rightarrow CIE\ \ La^*b^*\rightarrow LCh.$

## Conclusion
- The gradients came out much better when using a cylinder based color space, especially when that color space is based on *Lab*
- It would be worth looking into finding a efficiently written
- Might be worth trying to spin off [[Quite okay Image Format |personal_projects.Quite Ok Image Format]] with a Lch encoding.


[^1]: https://colab.research.google.com/drive/1oB74E0J_cruK6b9RIyjHAGj38l4cB5RV?usp=sharing