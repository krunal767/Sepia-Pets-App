# Sepia-Pets-App
This application has developed in SwiftUI with MVVM Structure.


# Getting Started
I have implement SDWebImageSwiftUI Package Dependencies in this project. and it's use for display image from URL. 

[![SwiftUI](https://img.shields.io/badge/SwiftUI-3,4-orange?style=for-the-badge)]()
[![SDWebImageSwiftUI](https://img.shields.io/badge/SDWebImageSwiftUI-V2.2.2-blue?style=for-the-badge)](https://cocoapods.org/pods/SDWebImageSwiftUI)


Here is SDWebImageSwiftUI Dependencies URL.
```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0")
    ],
)
```


## Description
Their are 2 screen in this app. 
- On First screen displayed all pet list and that data comes from static json.
- On Second screen displayed pets content. user can see content pet wise.
- Content are visible during working hours and weekdays that is show from config file. If working Hours over then showing popup with message.


## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

