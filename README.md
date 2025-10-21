# Snake Mechanics Test
This is based on https://github.com/lagagain/Snake-Game.Godot implementation of the classic Snake game. It uses sprites for the body.

The following changes of the base mechanics are made:
- use [WorldBoundaryShape2D](https://docs.godotengine.org/en/stable/classes/class_worldboundaryshape2d.html) for the world boundaries
- Snake moves along the world boundaries
- use [CharacterBody2D](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html) for Snake head
- movement logic for body limbs is moved within the limbs itself
