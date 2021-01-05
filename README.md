# Outpost Planner

Automatically build mining outposts. The tool will place the miners, power poles and belts before merging together the outgoing lanes.
To use select an ore patch with the tool.
By default the mod will clear trees and rocks in the area selected, if shift is held then friendly entities will be deconstructed as well, keep in mind that the resulting outpost may be bigger than just the ore patch itself.
This mod depends on [PlannerCore](https://github.com/Ben-Ramchandani/PlannerCore)

![OP example image](http://i.imgur.com/tUoPH24.png)

[Link to Factorio mod website](https://mods.factorio.com/mods/bob809/OutpostPlanner)

[More pictures](http://imgur.com/a/w0vgh)


## Basic settings

The mod includes an in-game GUI to change some settings which can be accessed via a small button in the top left of the screen 'OP'.


![OP settings](https://i.imgur.com/xGal4Y2.png)

From the left:

* Open the advanced settings window.
* Change the direction of the output belts (N, E, S, W).
* Change the maximum number of output belts. If there are more rows of miners than this number then the extra rows will be merged together.
  If you click this button with an item in your hand then the number of items in the stack is read.
* Change the transport belt used. The mod supports use of multiple transport belts, using faster ones only when necessary to maintain throughput.
  To start using a new transport belt click the button with it in your hand, it will appear to the right of the button.
  To stop using a transport belt click again with it in hand or click on its icon in the list.  
  For example, starting from the default (just normal transport belt), if you want the mod to use express belt only, you should click once with express belt in hand (to add it) and then
  click once with yellow belt in hand (to remove it).  
  You can instead click on this button with a chest and that will be used instead (for bot-based mining).

## Advanced settings

The advanced settings give you much more control over the mining layout, including support for custom blueprints.

![OP advanced settings](https://i.imgur.com/npNmMGP.png)

More basic settings appear, click on the button with one of these items in your hand to use that entity instead.

* Electric pole
* Pipe (when mining Uranium)
* Mining drill
* Chest (when using chests instead of belts)



This mod has a system for custom blueprints to alter the layout used.
Click on the read blueprint button with a blueprint in your hand and the mod will parse and use that blueprint.
Several example blueprints are provided, either to be used as they are or as a starting point for your own custom one.
Looking at these examples in-game is likely the best way to understand this mod, but further explanation is provided below.


### Mod mechanics

When an area is selected with the tool the ores are sorted by the product(s) of mining them and the ore(s) with the most common product(s) are selected.
The mod then proceeds to place the current blueprint in rows over the ore.

Miners are only placed when:

* There is no foreign ore in their mining area
* There is valid ore in their collision box

Belts are only placed when miners have already been placed in that row.
Electric poles are (by default, see below) placed later only as necessary to power all blueprint entities.
Other entities (chests e.t.c.) are (again by default) placed when miners are placed from that blueprint.

### Blueprints

The following constraints are placed on blueprints:

* Must have exactly one type of miner
* Must have at most one type of electric pole
* Must have at most one type of container

Additionally for pipes to be placed when fluid mining (Uranium):

* The miner must have a 3x3 collision box (information about pipe connections is not available to the Lua API at runtime, so the pipe connections are assumed to be identical to a vanilla Electric Mining Drill)
* All miners must be facing North or South

For smart transport belt selection:

* There must be one or more transport belts leaving the blueprint on the East side
* The blueprint may not have any underground belts leaving it

For determining the size of the blueprint Electric poles are ignored. A dummy entity (Wooden Chest by default) can be used to increase the size of the blueprint, but is not actually placed.

### Electric pole placement

There are currently three options for electric pole placement:

* Always: place every electric pole.
* Simple: Place electric poles at regular intervals, determined by the supply area and maximum wire distance of the poles used. For example a medium electric pole might be placed every three blueprints.
* Smart: As above, but electric poles are placed last and only as required to power all entities.

If non-miner entities in the blueprint require power (e.g. Lamps) then Electric poles will always be placed in simple mode.


## Other settings

The config file (`config.lua`) can be edited directly to change how the mod behaves (this *must* be the same between players in multiplayer). These options can also be changed for all existing players (multiplayer-safe) on a per-save basis with a command from the Lua console, e.g.

    /c remote.call("OutpostBuilder", "config", {pole_name = "medium-electric-pole", run_over_multiple_ticks = false})


## Roadmap

Planned improvements to the mod, in the order which I'm planning to implement them.
Feel free to open a GitHub issue with a feature request if there's something you would like that isn't here.

* Add support for placing train stations attached to the output belts of an outpost.
  * Ensure belts align (tracks are placed on a half resolution grid).
  * Check blueprints rotate properly.
  * Need to be able to connect up electric poles
* Add support for placing walls around an outpost.
  * Four different wall segments, all user changeable with blueprints
    * Normal wall section
    * Corner
    * Train gate
    * Filler section (one tile wide)
