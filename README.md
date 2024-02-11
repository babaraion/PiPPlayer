# PiPPlayer
 Picture-In-Picture Player with remote URL

## Table of Contents

- [Introduction](#introduction)
- [Demo Video](#demo-video)
- [Tools and Technologies](#tools-and-technologies)
- [Project Structure](#project-structure)
- [Usage](#usage)

## Introduction
This project is a demo for showing a PiP mode with remote video URL. It is developed for all the orientations on iPhone/iPad and works perfectly. 
#### Note:- 
 PiP player only works in iPad simulator not in iPhone simulator so please test it on real device.Otherwise, you can test it on iPad simulator.

## Demo Video

You can find demo video of app working below.

[Demo Video](https://drive.google.com/file/d/1t3J8imeYkyDWCzKYSWXAAg7Huhgzabk2/view?usp=drive_link)

### Features
- Tap to preview video
- Video Player with remote URL.
- Aspect ratio maintained in landscape and portrait mode for both video Modes.
- User can close the video player with cross button
- PiP mode can work in background

## Tools and Technologies

List of tools and technologies used in this project.

- **Xcode**: Version 15.1
- **Programming Language**: Swift
- **SwiftUI**
- **AVPlayerController and AVPlayer**
- **MVVM/Clean Architecture**
- **Unit Testing with XCTest**

## Project Structure

Project structure is as follows:

 - PiPPlayer
  - PiPPlayerApp
  - ContentView
  - PiPModule
    - PreviewModule
      - Model
      - ViewModel
      - UI
    - VideoPlayerModule
      - Models
      - ViewModel
      - UI
 - CommonViews

- PiPPlayerTests
  - PreviewViewModelTests


## Usage

Provide instructions on how to set up and run your project. Include any configuration steps or prerequisites.

1. Clone the repository: `git clone https://github.com/babaraion/PiPPlayer.git`
2. Open the project in Xcode.
3. Run the project on simulator(iPad) or a physical device.
