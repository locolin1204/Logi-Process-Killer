# Logi Process Killer

<p align="center">
  <img src="./Logi Process Killer/Assets.xcassets/AppIcon.appiconset/icon-mac-512x512@2x.png" alt="Description of image" width="75">
</p>

## Motivation

Everytime when I switch my MX master from my work laptop to my MacBook, or when I wake my MacBook from sleep mode, somehow the mapped keys are not working anymore.

Forward/Backward buttons are not working, predefined mouse gestures are not recognized.

I would have to go in Activity Monitor, type and search the process, kill it, to make it to work again, which is easy but it is just annoying to deal with every time.

As a developer, why don't make it easier? Place a button where I can always access it and kill it with 1 click, no more opening Activity Monitor, no more typing and searching for the same process every time.

Just 1 click to kill.

Automate it whenever possible, otherwise, time is wasted.

## Implementation

I created a menu bar application so that it can be accessed easily.

<p align="center">
  <img src="./images/menubar-screenshot.png" alt="Description of image" width="500">
</p>
It got 1 simple function: to kill the process, a notification will appear to inform the user whether the process has successfully killed or not
