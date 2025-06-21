# CastarSDK Flutter Template

A ready-to-go Flutter project template configured for unsigned .ipa builds via GitHub Actions with CastarSDK integration.

## Project Structure

```
your_project/
├── .github/
│   └── workflows/
│       └── ios-ipa-build.yml          # GitHub Actions workflow
├── ios/
│   ├── Frameworks/
│   │   └── CastarSDK.framework/       # CastarSDK framework
│   ├── Flutter/
│   │   └── Generated.xcconfig         # Framework linker settings
│   └── Runner/
│       ├── AppDelegate.swift          # CastarSDK initialization
│       ├── Info.plist                 # App configuration
│       ├── Main.storyboard            # Main interface
│       ├── LaunchScreen.storyboard    # Launch screen
│       ├── Assets.xcassets/           # App assets
│       └── Runner-Bridging-Header.h   # Swift-ObjC bridge
├── lib/
│   └── main.dart                      # Flutter app entry point
├── pubspec.yaml                       # Flutter dependencies
└── README.md                          # This file
```

## Setup Instructions

### 1. Prerequisites
- Flutter SDK (stable channel)
- Xcode (for iOS development)
- CastarSDK.framework

### 2. Configuration

#### CastarSDK Integration
1. Place your `CastarSDK.framework` in `ios/Frameworks/`
2. Update the devKey in `ios/Runner/AppDelegate.swift`:
   ```swift
   let result = Castar.createInstance(devKey: "YOUR_ACTUAL_DEV_KEY")
   ```

#### GitHub Actions
The workflow is already configured to:
- Install Flutter and dependencies
- Install CocoaPods
- Copy CastarSDK.framework
- Inject framework linker settings
- Build unsigned IPA
- Create a GitHub Release with the IPA

### 3. Build Process

#### Local Development
```bash
flutter pub get
flutter run
```

#### GitHub Actions Build
1. Push your code to the repository
2. GitHub Actions will automatically:
   - Build the unsigned IPA
   - Create a Release tagged `v1.0`
   - Upload the IPA as a release asset

## Key Features

### Framework Integration
- **CastarSDK.framework**: Embedded in `ios/Frameworks/`
- **Linker Configuration**: Automatically injected via `Generated.xcconfig`
- **Swift Integration**: Proper bridging header setup

### Build Configuration
- **Unsigned IPA**: Built with `--no-codesign` flag
- **Framework Search Paths**: Configured for CastarSDK
- **Permissions**: Camera, microphone, and location access configured

### GitHub Actions Workflow
- **macOS Runner**: Uses `macos-latest`
- **Flutter Setup**: Installs stable Flutter channel
- **Dependency Management**: Handles Flutter and CocoaPods dependencies
- **Automated Release**: Creates tagged releases with IPA artifacts

## Validation

### Verify Build Success
1. Check GitHub Actions workflow completion
2. Verify IPA exists in the Release assets
3. Confirm CastarSDK.framework is embedded:
   ```bash
   unzip -l FlutterIpaExport.ipa
   # Look for: Payload/Runner.app/Frameworks/CastarSDK.framework
   ```

### Verify Unsigned Status
```bash
codesign -dv --verbose=4 FlutterIpaExport.ipa
# Should show errors about missing signature
```

## Troubleshooting

### Common Issues

1. **Framework Not Found**
   - Ensure CastarSDK.framework is in `ios/Frameworks/`
   - Check `Generated.xcconfig` has correct paths

2. **Build Failures**
   - Verify Flutter and CocoaPods versions
   - Check iOS deployment target compatibility

3. **Permission Issues**
   - Review `Info.plist` for required permissions
   - Ensure usage descriptions are provided

### Support
For CastarSDK-specific issues, refer to the official CastarSDK documentation.

## License
This template is provided as-is for educational and development purposes. 