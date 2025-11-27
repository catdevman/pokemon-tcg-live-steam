# pokemon-tcg-live-steam
Get Pokemon TCG Live game working on steam with Linux

# Prereqs
- Steam installed
- Protontricks installed

# Setup

- Download the MSI file [here](https://installer.studio-prod.pokemon.com/installer/PokemonTCGLiveInstaller.msi)
- Install like a normal non-Steam game in Steam, I used the proton hotfix compatability (this should still work but it you're having issues try a few different ones of these)
- Once installed change the name in Steam to something like `Pokemon TCG Live` (Currently it will be whatever the msi filename was, which isn't very readable)
- Open protontricks and find your newly installed `Pokemon TCG Live`, double-click the title and click ok on all the popups that may popup telling you about wine and 64-bit etc... eventually you'll get a window with some options
- Select the option `Select the default wineprefix` and click `OK`
- After that you'll get another window and select `Run a commandline shell (for debugging)`, this should open a terminal.
- Run `cd ../..` this will take you into the `pfx` directory for your install
- Run `pwd` take note of this path (ex: "/home/<username>/.local/share/Steam/steamapps/compatdata/3131373328/pfx") and of the appid which should be a long number (ex: 3131373328) you will need these later
- Run `cd drive_c/users/steamuser` then `ls -al`, this changes you into the directory for the steamuser and then lists the files/directories, you should see a directory `'The Pokémon Company Interational'`
- The next couple of steps of renaming directories will just make everything easier later on technically you wouldn't have to do this but then everywhere that has the `é` you need to make sure that is encoded correctly depending on the context linux or windows in wine, see complicated... easier to just fix this once now :smile:
- Run `mv 'The Pokémon Company Interational' 'The Pokemon Company Interational'`
- Run `cd 'The Pokemon Company Interational'` and `ls -al` you should see `'Pokémon Trading Card Game Live'` rename this using `mv 'Pokémon Trading Card Game Live' 'Pokemon Trading Card Game Live'`
- Run `cd `Pokemon Trading Card Game Live'` and `ls -al` you should see an exe named `Pokemon TCG Live.exe` and of course they made this one easy without the accent nice
- Run `pwd` and take note of this path and the exe name you'll need that all together here in a moment
- Open Steam, Library, right-click on `Pokemon TCG Live` and select Properties under Shortcut you'll see the name you change earlier and `Target` and `Start In`, for Target using quotes `"/home/<username>/.local/share/Steam/steamapps/compatdata/<appid>/pfx/drive_c/users/steamuser/The Pokemon Company International/Pokemon Trading Card Game Live/Pokemon TCG Live.exe"` and for Start In it'll look like `"/home/developer/.local/share/Steam/steamapps/compatdata/3131373328/pfx"` in quotes, exit from Properties.
- Close the terminal that Protontricks open and you should get the Protontricks window back, choose "Install a Windows DLL or component" and select `vcrun2019`, once this completes you
- (Optional) Open Steam and start `Pokemon TCG Live` this will just check to see if the game is working enough to do the rest and ensure that all the work you've done up to this point is correct, you should be able to choose a language but then the login part will fail that is expect, if you did this step then close out of the game now
- Download the `steam_fix.reg` file from this repo
- Open Protontricks again and choose `Run regedit`, once regedit is open under the `Registry` menu and choose `Import Registry File` and select the `steam_fix.reg` file and you should get a dialog saying it was imported correct, click ok on that and close out of the registry and Protontricks we won't need that any longer
- Download `ptcgl-handler.sh` from this repo and put it in `~/.local/bin/ptcgl-handler.sh` and make it executable by opening a terminal and running `chmod +x ~/.local/bin/ptcgl-handler.sh`, update the value for `APPID` and `PROTON_PATH` also look at the rest of the file if you understand the values and any of them look wrong go ahead and edit them
- Download `tpcitcgapp-handler.desktop` and put it in `~/.local/share/applications/tpcitcgapp-handler.desktop`, edit Exec to the be your full path to where you put `ptcgl-handler.sh`
- Run `update-desktop-database ~/.local/share/applications/` this might give you errors just make sure that none of them are for `tpcitcgapp-handler.desktop`
- Alright final steps, open Steam and open `Pokemon TCG Live` once loaded picked your language option and choose Ok, once you see the login failure message, press alt-tab to get out of the game without closing it, you should see that it opened your browser to the pokemon login page, ensure it is a legit login page, and login, it might pause for a moment it is essentially opening the game in the background and doing the login process. After a little while (10 seconds or so) you can press alt-tab until you get back to the `Pokemon TCG Game` and you should see it doing the normal downloading `catching wild pokemon`, `printing cards` etc...
- Profit???
