# TestVisionOS for Apple Vision Pro

This project contains a SwiftUI application developed for Apple Vision Pro. The app demonstrates advanced features such as immersive space handling and speech recognition, showcasing the integration capabilities of VisionOS.

## Features

- **Immersive Space**: Toggle to show or hide an immersive 3D space, managed by environment variables `openImmersiveSpace` and `dismissImmersiveSpace`.
- **Speech Recognition**: Users can interact with the app via speech using the microphone button, which leverages `SFSpeechRecognizer` and `AVAudioEngine` to process and recognize spoken words.

## Requirements

- iOS 15.0 or later
- Xcode 13.0 or later
- Swift 5 or later
- Permissions for microphone and speech recognition must be enabled in your device's settings.

## Installation

1. Clone the repository:
```git clone https://github.com/alexjilavu29/TestVisionOS.git```
2. Open `TestVisionOS.xcodeproj` in Xcode.
3. Ensure that you have the correct target selected (Apple Vision Pro).
4. Build and run the application on a compatible device or simulator.

## Usage

- **Immersive Space**: Toggle the switch labeled "Show Immersive Space" to enter or exit the immersive space experience.
- **Speech Recognition**: Tap the microphone icon and start speaking. The recognized text will appear in the text field above the microphone icon.

## Contributing

Contributions are welcome! Please fork the repository and open a pull request with your suggested changes.


