# Non-Steam Storage
 Script to add Non-Steam game to Steam's storage menu.

 Currently requires Protontricks.

# How to use

1. Add the Non-Steam game to Steam normally. Go into Properties Menu, Compatibility and force the use of Proton. The version doesn't matter, this is required even for Native games as we need Steam to generate the Compatdata folder with the games. This seems to be the easist way to get the AppID for the added game.

2. Run the script in Konsole, enter the name of the game, then enter the path where your game is installed. The script will create a new appmanifest_{appID here}.acf file. Place this in the steamapps folder on the drive your game is installed on.

3. Restart Steam then check the storage menu, your Non-Steam game should be shown.

# How does it work?

Script uses Proton tricks to find the AppID of the game. This isn't ideal since for Native games and other launchers like Heroic you need Steam to generate otherwise useless files. I've tried to find any simple ways to do this but haven't found anything. Please let me know if there's a better solution. It also requires the path to the game to determine the game's size which isn't ideal

Feel free to use and edit as you wish.
