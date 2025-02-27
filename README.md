# Mac Dial

macOS support for the Surface Dial. The surface dial can be paired with macOS but any input results in invalid mouse inputs on macOS. This app reads the raw data from the dial and translates them to correct mouse and media inputs for macOS.

## Building

Make sure to clone the hidapi submodule and build the library using the build_hidapi.sh script. Note: This app depends on a hidapi fork, check the submodule to see what changed. App should then build with XCode.

You can find universal builds of the app under "releases". Note that these builds can be outdated.

## Usage

The app will continously try to open any Surface Dial connected to the computer and then process input controls. You will need to pair and connect the device as any other bluetooth device.

The app currently supports two modes:
* Scroll mode: Turning the dial will result in scrolling. Pressing the dial is interpreteded as a mouse click at the current cursor position.
* Playback mode: Turning the dial controls the system volume of your mac. Pressing the dial plays / pauses any current playback while a double click sends the "next" media action.

To change mode, click the Mac Dial icon in the system menu bar.

If you want to app to run at startup you will need to add it yourself to the "login items" for your user.

## Features
- [X] Default controllers
  - [X] Scroll
  - [X] Playback
  - [X] Mission
  - [X] Luminance
- [X] Custom shortcut controllers
  - [X] Data storage
  - [X] Preference UI
    - [X] Named label
    - [X] SF icon chooser

## macOS 15 Compatibility

This fork adds compatibility with macOS 15:

1. Updated deployment target to macOS 15.0
2. Fixed EXC_BAD_ACCESS issue in Hardware.swift disconnect method
3. Updated hidapi library integration
4. Ensured all dependencies are compatible with macOS 15

The app supports all features of the Microsoft Surface Dial on macOS 15.