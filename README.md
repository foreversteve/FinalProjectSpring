# APCS FinalProjectSpring

## Instructions
How to run:
1. Download the Gravity directory.
2. In a bash shell, run
~~~~
$ processing Gravity.pde
~~~~

## Basic Description

A “WASD” space-shooter style game with the goal of destroying all hostile units in a map with multiple planets, moons, and AI.

## How to play:
1. Choose one of 3 different maps by mouse-clicking.
2. One of three pre-generated maps would be drawn.
3. Control the player's movment with the WASD keys. All movements are affected by gravitational fields.
4. Win condition.
  * All hostile units on the map are destroyed.
5. Player Health will be displayed on top left corner of the screen.
6. Hostile Projectiles (friendly-fire not enabled) will decrease the player's health
7. Avoid getting hit up hostile projectiles: player loses automatically upon reaching 0 health.

## Features
  * Working, semi-realistic ingame physics.
  * Balanced Maps
  * Key and Mouse Controls.
  * Three pre-built maps to choose from.
  * Ability to shoot and destroy hostile entities.
  * Different GameStates. (IntroMenu, in-game, and end-game)
