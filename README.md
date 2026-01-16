# Logi Process Killer

<p align="center">
  <img src="./Logi Process Killer/Assets.xcassets/AppIcon.appiconset/icon-mac-512x512@2x.png" alt="Description of image" width="75">
</p>

## Motivation

Everytime when I switch my MX master from my work laptop to my MacBook, or when I wake my MacBook from sleep mode, somehow the mapped keys are not working anymore.

<p align="center">
  <img src="./images/logi-options.png" alt="Description of image" width="500">
</p>

Forward/backward buttons are not working, predefined mouse gestures are not recognized.

I would have to go in Activity Monitor, type and search the process, kill it, to make it to work again, which is easy but it is just annoying to deal with every time.

<p align="center">
  <img src="./images/logi-options-daemon.png" alt="Description of image" width="500">
</p>

As a developer, why don't make it easier? Place a button where I can always access it and kill it with 1 click, no more opening Activity Monitor, no more typing and searching for the same process every time.

Just 1 click to kill.

Automate it whenever possible, otherwise, time is wasted.

## Description

macOS: 12.3+

I created a menu bar application so that it can be accessed and kill the `Logi Options Daemon` process easily.

<p align="center">
  <img src="./images/logi-options-daemon-activity-monitor.png" alt="Description of image" width="500">
</p>

This Logi Process Killer is to kill the Daemon of `Logi Options`

> [`Logi Options`](https://www.logitech.com/en-hk/software/options.html) a powerful and easy-to-use application that enhances your Logitech mice, keyboards, and touchpads. Customize your device with Options to achieve more, faster. <p align="center">
> <img src="./images/logi-options-logo.png" alt="Description of image" width="50">

</p>

Why do I not need to launch the `Logi Options Daemon` again? Because it will automatically boot up itself after being killed

<p align="center">
  <img src="./images/menubar-screenshot.png" alt="Description of image" width="500">
</p>
Features

- Kill `Logi Options Daemon` - a notification will appear to inform the user whether the process has successfully killed or not
- Launch at Login - everytime you restart, you won't need to launch it manually

### Success notification

<p align="center">
  <img src="./images/success-terminate.png" alt="Description of image" width="500">
</p>

### Fail notification

<p align="center">
  <img src="./images/fail-terminate.png" alt="Description of image" width="500">
</p>
