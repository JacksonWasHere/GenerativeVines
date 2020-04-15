# Generative Vines

This program generates different types of vines. The basic algorithm works as follows; first we have a parent dot.
This parent will have a direction that it will move in while being continuosly drawn. This results in a straight line or curved depending on settings. Everytime a dot is drawn it has a chance to produce a child dot with parent size - 1. The child will be given a random direction based off of the parent direction. The child will then behave in the same manner as a parent. The dots generating children can create cool vine and crystal looking formations.

# Settings

This is what each setting controls. These settings are similar to image number 4

### child gamerules
`float childRange = PI/2;`
How far a child can turn from parent direction. Essentially how severe the branching is.

`float childVarience = childRange/2;`
Used to center or uncenter branching

`float branchChance = 0.5;`
How likely it is to branch off at each iteration. How many times out of 1

`int childGenType = 1;`
There are different ways to calculate reproduction odds. 0 is for constant odds. 1 makes it based on the population, the more dots the less likely to reproduce. This helps prevent clutter, I recommend using 1 for most applications.

### individual gamerules
`int startSize = 4;`
How large the first dot is

`int dotLifeSpan = 0; // set at 0 for infinite`
How long dots live

`float dotTurning = PI/4;`
How intense is the organic turning

`boolean organic = true;`
Turning is organic or crystal. Organic means that the motion will have varience causing a curved path. Otherwise each dot will follow a straight line

`PVector startSpeed = new PVector(0,5);`
Vector for the first dot

# Examples

### EX: 1
short lifespan and organic motion, high branching
![Imgur](https://i.imgur.com/f7le67q.png)
### EX: 2
short lifespan and crystal, high branching
![Imgur](https://i.imgur.com/a8nvhZg.png)
### EX: 3
low narrow branching, infinite crystal
![Imgur](https://i.imgur.com/KMOS6i2.png)
### EX: 4
wide branching, medium branching chance, organic, no lifespan
![Imgur](https://i.imgur.com/OFyv4VI.png)

# Controls

use r key to reset
click to add a tree
