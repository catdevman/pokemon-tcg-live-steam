   # pokemon-tcg-live-steam
    Get Pokemon TCG Live game working on Steam with Linux.

    *Note: This process has been vastly simplified! The setup is now fully automated using `umu-protonfixes` as long as you use GE-Proton.*

    ## Prereqs
    - Steam installed
    - **GE-Proton** (version 9 or later) installed. *(You can use [ProtonUp-Qt](https://davidotek.github.io/protonup-qt/) to install it easily).*

    ## Setup
    1. Download the MSI file [here](https://installer.studio-prod.pokemon.com/installer/PokemonTCGLiveInstaller.msi).
    2. Add the MSI file to Steam as a Non-Steam Game.
    3. Right-click the newly added shortcut in your Steam Library and go to **Properties**.
    4. In the **Compatibility** tab, check the box and select your installed **GE-Proton** version.
    5. In the **Shortcut** tab, under **Launch Options**, add the following exact string:
       ```text
       UMU_ID=umu-ptcgl %command%

  (This tells GE-Proton's built-in  umu-protonfixes  script to automatically install  vcrun2019 , apply the necessary registry keys, and generate the Linux handlers for you!)
  6. Click Play to run the installer. Complete the installation wizard normally and close it.

  ## Configure the Final Game

  1. Open the Properties of the shortcut again.
  2. Change the Shortcut Name to  Pokemon TCG Live .
  3. Change the Target and Start In fields to point to the newly installed executable. The installer usually puts it in a path similar to this:
      • Target (include the quotes):  "/home/<your-username>/.local/share/Steam/steamapps/compatdata/<random_number>/pfx/drive_c/users/steamuser/The Pokémon Company Interational/Pokémon Trading Card Game Live/Pokemon TCG Live.exe"
      • Start In (include the quotes):  "/home/<your-username>/.local/share/Steam/steamapps/compatdata/<random_number>/pfx/"
      (Make sure to replace  <your-username>  and the  <random_number>  with your actual paths!)
  4. Important: Keep the  UMU_ID=umu-ptcgl %command%  in the Launch Options.

  ## Play

  1. Launch the game from Steam.
  2. Select your language and hit OK.
  3. When it reaches the login failure screen, hit Alt-Tab. You should see it has automatically opened your Linux browser to the Pokémon login page.
  4. Log in on your browser. Our automated script will seamlessly catch the login callback and hand it back to the game running in Wine.
  5. After a few seconds, Alt-Tab back to the game. You should see it successfully downloading and loading!
