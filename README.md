# iOS SwiftUI Mandatory Update Check
This repository demonstrates how to implement a mandatory update check in a SwiftUI iOS app. It ensures users are prompted to update their app when their version is below the minimum supported.

<img width="292" alt="image" src="https://github.com/user-attachments/assets/4392846a-8208-44f2-b935-782f9a31331a" />


## Requirements
- iOS 17 or higher
- SwiftUI
- Xcode 15+

## Features
- Checks the minimum supported app version from a remote source
- Displays an alert forcing users to update
- Simple and lightweight SwiftUI implementation

## Use Cases
- Ensure all users are on supported version(s)
- Enforce critical updates for bug fixes and security patches
- Improve user experience by preventing outdated app usage

📌 Ideal for iOS developers looking to add a force update mechanism to their SwiftUI apps!

## Steps to Run the App
### Clone the repository

```sh
git clone https://github.com/steelcityamir/ios-swift-mandatory-update-check.git
cd ios-swift-mandatory-update-check
```

### Open the project in Xcode

Double-click the .xcodeproj or .xcworkspace file.
Alternatively, open Xcode and select File > Open, then choose the project folder.

### Select a Simulator or Device

In the top menu bar of Xcode, click on the device selector.
Choose an iPhone or iPad simulator, or a connected physical device.

### Run the App
1. Click the ▶️ "Run" button in Xcode to launch the app in your selected simulator or device.
   
2. By default, the app version is set to 1.0.0, which is below the minimum required version (2.0.0). As a result, the Mandatory Update screen will be displayed.

3. To bypass the update prompt and access the main view:
   - Open Xcode > Project Navigator.
   - Locate the app's Info.plist file.
   - Update the CFBundleShortVersionString to 2.0.0 or higher.
   - Rebuild and relaunch the app.
