# Doomerang
## Summary
You are a cursed boomerang in a world overrun by zombies. Fly through the horde, take out the undead, and keep yourself in the air as long as you can. The more you return, the more destruction you leave behind.

## Inspiration
### Miside: Penguin Piles
![Image](https://github.com/user-attachments/assets/c3b2ea1f-b3f0-4378-b7c2-ac0a5eea2e79)

The penguins movement in this minigame is the one I'm using for my game where there is intertia when changing direction mimicking boomerang.
In this minigame, player goal is to collect snowballs by crashing into them, same with my game altough it's to kill zombies.

### Plant vs Zombies
![Image](https://github.com/user-attachments/assets/63d7b22c-cdb3-4398-916e-38ce40e6360c)

The game will have waves of zombies like plant vs zombies where player (the boomerang) need to clear the wave before the zombies destroyed the gate of the base.

## Platform
- Browser
- PC (Windows, Linux, MacOS)

## Genre
- Singleplayer
- Casual

## Target Audience
Targetted towards casual gamer who just want to have fun.

## Development Software
- Game engine: Godot 4.3 with Gdscript
- Art: Aseprite
- Sound: jsfxr
- Text editor: nvim
- Version control: git & Github


# Concept
## Gameplay Overview
The player control the only weapon (boomerang) the clan have to defend a base from hordes of zombies. Player must fly through the zombies to hit and kill them. The main goal is to stop zombies reaching the base and destroying the gate.


## Primary Mechanics
Boomerang (player) will be thrown by the boomerang master, to the field, in front of the gate, to hit the zombies.
player then need to control the direction of the boomerang, make sure to hit zombies as efficient as possible because
there will be energy/breath/ or whatever suitable mechancis, where if it depleted, it means the boomerang will fell down
and can't move, this will reduce player heart (player start with 3 heart). so player need to go back to the thrower when the whatever bar
almost depleted, so thrower can throw player again and reset the whatever energy bar.
if player hit the wall on the right and left, player will reduce 50% of max whatever bar.
most zombies will just move forward to the gate, player need to defend this gate, i guess there will be hp for this gate
player goal is to kill as many as he can before the zombies reach the gate
there are type of zombies, 
- basic
- runner
- bomber (if hit, it will trigger their bomb state, after 2-3 seconds they explode)
- stunner (this zombies wear steel armor, same affect as hitting wall)

Here's a couple of player mechanic I can think of:
- dash, this is for more efficient and to counter stunner zombie, also can be used to bounce off wall


## Todo
- [ ] Bomber zombie
- [ ] Stunner zombie
- [ ] Player soul
- [ ] Base integrity
