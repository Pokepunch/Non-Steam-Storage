#!/bin/bash
# Script to make a manifest file for a Non-Steam game. Requires Protontricks.

PROTONTRICKS_NATIVE="protontricks"
PROTONTRICKS_FLAT="flatpak run com.github.Matoking.protontricks"

# Credits to Jannomag for this check for Proton.

if [ "$(command -v $PROTONTRICKS_NATIVE)" ]; then
    PROTONTRICKS=$PROTONTRICKS_NATIVE
elif [ "$(command -v $PROTONTRICKS_FLAT)" ]; then
    PROTONTRICKS=$PROTONTRICKS_FLAT
else
    echo "Protontricks could not be found! Please install it. Aborting..."
    exit
fi

# We need to use Protontricks toget the AppID of the non-Steam game using it's exact name.

echo "Please enter name of non-Steam Game. This needs to match the name in Steam."
read gameName
appID=$($PROTONTRICKS -s "$gameName")

# Check to see if the name matches, sanity check to avoid getting the wrong game's ID.

if [[ "$appID" == *"$gameName"* ]]; then
    appID=$(sed -n 's/.*(\([^)]*\)).*/\1/p' <<< "$appID")
else
    echo "Can't find game. Please ensue you've run the game with Proton enabled (even for native games!) and check you've entered the correct name. Aborting..."
    exit
fi

echo "Non-Steam Game AppID is: $appID"

# We're getting the install path just so we can get the game size.

echo "Please enter the install path for the game"
read installPath

gameSize=$(du -b -s "$installPath" | cut -d'/' -f 1 | sed 's/.$//g')

echo "Game install is $gameSize bytes."

# We're copying and adding all the info to game's new manifest file.

cp appmanifest_.acf appmanifest_$appID.acf

sed -i "s/appid_replace/${appID}/" appmanifest_$appID.acf
sed -i "s/gamename_replace/${gameName}/" appmanifest_$appID.acf
sed -i "s/gamesize_replace/${gameSize}/" appmanifest_$appID.acf

echo "Process complete! Please move the generated appmanifest_$appID.acf file to the steampps folder on the drive game is installed on. You will need to restart Steam for changes to take affect. You can close this window."


