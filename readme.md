# Cube Solver
I will only give myself a week (until September 16, 2026) to finish this project. The end goal is to 
develop an application that is capable of solving a cube.

## Personal Notes
These are my personal notes where I can indulge on what I did on that particular day. I started this a little bit 
later in the project.
### 2026/9/11
Programming how a cube moves is like trying to map the interior of your own house with a blindfold while tripping 
on acid. It's like navigating through a maze, but every single way through leads to another fork in a series of 
never-ending forks. It's like trying to make sense of a non-euclidian space as a Sumerian that has never touched 
math or anything even remotely similar to a number system. I don't think I will ever obtain the mental post-code 
clarity capable of producing such a descriptive illustration of the unique form of suffering present within these 
lines of code ever again.\
\
I know for a fact that the moveset I have developed for the respective moves of the 3x3 cube don't actually turn 
exactly as a normal cube would turn, but I really don't care at this point lmao. It's a cube thingy in an 
application and it turns, but not exactly coming up with valid scrambles, in fact all of the turns seem to be 
invalid/incoherent with one another. I am going to need to literally copy a cube 1\:1 when I have the mental 
fortitude rejuvenated to do so. As of right now, my head is pounding like if my head was between my thighs and I 
have been squeezing it until it almost pops like a watermelon in a hydraulic press.\
\
In either case though, now the fun part actually starts where I sus out how I am going to scramble and solve the 
cube. Scrambling is the easy part, just generate a random number of moves and solving it would be where most of my 
attention is needed. That is where I am going to spend the most of my time.\
\
For now, however I have to declare the `data/status.lua` file in the `main.lua` file at the repo-root directory 
due to the simple fact that my code has been handling multiple instances of `Status.Cube` which results in the 
application constantly becoming desynced with itself (in an offline environment :vomiting_face:) and that's cringe. 
After I fix that, which I foresee fixing it tomorrow first thing's first probably a 10 minute fix and then go 
on and break a titan's ballsack and build the table-search algorithm specifically for searching for a solution to 
this cube. I just hope that with the way the cube moves that it is solveable. In theory it should be solveable as 
the starting position is possible to reach and change just by reversing the move order I scrambled it in, but 
that's a boring way to do it.