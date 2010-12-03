# Droom - A space shoot'em up
–	A space shoot'em up written in actionscript 3. By: Ola Lundén, KY-Akademien 2010

### Summary
This document is about a project done during three intense weeks at KY-Akademien Lindholmen Göteborg. The project is about a space shoot'em up game created in Flash and Actionscript 3 where the focus was to complete the first level. The source code and all files used for the project is available at github through the following address: http://github.com/ollu/droom . Enjoy!

### Background
I started developing the idea for this game some years ago in Actionscript 2. I was programming it in my spare time. The idea was to make it feel something like the old Commodore 64 games such as [Delta][1], [Nemesis][2], [Uridium][3] and [Zaxxon][4] but adding the twist of the new era of computer languages and graphics. Since I am not really a graphics designer but I still like the chance of playing around with game art, I have many times found myself caught up for hours working with the game graphics for example minute details like the movement of an antenna on a Drone ship.

[1]: http://www.youtube.com/watch?v=LlwgAzgK7ws "Delta C64 on Youtube"
[2]: http://www.youtube.com/watch?v=WTRh9aH5tgs "Nemesis C64 on Youtube"
[3]: http://www.youtube.com/watch?v=G_l80FSLpps "Uridium C64 on Youtube"
[4]: http://www.youtube.com/watch?v=tPGjW6qyQ_M "Zaxxon C64 on Youtube"

When I had the first part of the game almost done the release of Actionscript 3 came out on the market and due to this I thought it would be a good idea to rewrite the game. The task at first proved to be somewhat more daunting then I had imagined so I put in the project into hibernation. This gave me the time to read up on the new Actionscript 3 giving me the knowledge to continue with the development of the project leading to the current version you can see today.

In the autumn of 2009 I enrolled in an education and thought formed that this could be the place to continue with the project and finish what I have started. Once again I found myself pressed for time and hence I was forced to reevaluate the scale of the project. During this process I finally  realized that this was an ideal final project in which I could freely set my own goals and how to achieve them.

### Goal
The goal for this project was to get the program in its new shape, that is transform it from its old code base written in as2 to as3. Also I wanted to try and adapt a more self documented code.
At the beginning these were my goals:

* one level
* two types of enemies
* one end level boss
* bonus items to shoot down to receive power ups for the ship (not implemented)
* start screen
* end screen when you die
* game theme

### Limits
The time set for the project has been a delimiting factor which has made me attach less focus to some goals and some were removed altogether. Another limiting factor is that I am mainly a programmer and not a designer. Since this game is entirely developed by me there is a natural limit for the music composition and design.

### Presentation
You can steer the ship in all directions using the arrow keys on the keyboard but the distance you can move the ship is limited to the game area. For each time you press the space key a shot is fired. The shot will disappear as soon as it hits an enemy or has flown out of sight.

The Drone is the first encounter with enemies that player will have. The ship 	enter the scene from right and always exists on the left. If they do not get 	shot down they are removed from the game as well when they disappear in 	sight. Each Drone will stand a maximum of one hit from the players gun.

After four waves a Battle cruiser enters to claim vengeance for all the killed Drones and it will stay on stage as long as it takes the player to gun it down. When the player manages to destroy the Battle cruiser the player has made ten direct hits which will cause the Battle cruiser to explode.

Now when three waves of Drones and Battle cruisers has passed the ever so 	fearsome Jem'Hadar will come to their rescue and finally put this crusade to 	an end. Jem'Hadar is a tough and mean encounter, he will stand 20 direct 	hits from the player. He is also equipped with the double alien blasters so the player will really have to prove their flying abilities.
 
* The game point reward is as follows:
* Drone 50 points
* Battle cruiser 500 points
* Jem'Hadar 5000 points

If you manage to gun down all the Drones in a wave you are rewarded with a bonus item
The game ends if the player crashes into an enemy ship, there is no rescue for this mistake.

### Improvements
What can be done from this point on to improve the gaming experience? I have listed what I think is the most important improvements that can be made.

#### More levels
Adding more levels with a variety of different monsters furthermore bonus levels should be added where you can prove your flying skill or master your shooting accuracy. The later parts to enhance the feeling that you gain skill as you progress through the game.

#### Score board
The player will have the option in the end of the game to register on a score board to compete with other players. It should be written in PHP since I would like to keep this as much to open source as possible even though I know that Flash is not open source I did not want to get caught in another none open source programming language.

#### Sound
Adding audio for specific parts of the game for example when the hero ship is moving, shooting and taking hits. Also giving specific sounds to bosses and or levels would also be an improvement. This will most certainly enhance the gaming experience.

#### Movement patterns
Make each wave have its own movement pattern thus making it feel more unique and also harder for the player to discern a pattern.

#### Introduction story
Making up a good background story and telling it in a stirring and engaging way will bring the player into the mindset of the game and by this once again quite easily enhance the gaming experience.