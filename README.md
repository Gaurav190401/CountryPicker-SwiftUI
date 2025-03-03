# CountryPicker-SwiftUI

A SwiftUI-based country picker package that allows users to select a country along with its flag, country code, and phone code. The picker supports searching and selecting a country, with seamless navigation and state management.

## Features
- 📌 Display a list of countries with their flags, names, and phone codes.
- 🔍 Search functionality to quickly find a country.
- ✅ Highlight the selected country.
- 🛠 Load country data from a bundled JSON file.
- 📱 SwiftUI-friendly with NavigationLink and Sheet support.

## Installation

### Using Swift Package Manager (SPM)
1. Open your Xcode project.
2. Go to `File` > `Swift Packages` > `Add Package Dependency`.
3. Enter the repository URL: `https://github.com/Gaurav190401/CountryPicker-SwiftUI.git`.
4. Choose the latest version and click `Add Package`.

## Usage

### 1. Import the package
```swift
import CountryPicker_SwiftUI
```

### 2. Define a `Country` Binding
```swift
@State private var selectedCountry: Country? = nil
```

### 3. Use the `CountryPicker` view inside a NavigationView
```swift
NavigationView {
    CountryPicker(selectedCountry: $selectedCountry)
}
```

### 4. Using Sheet Instead of Navigation
If you prefer to present the picker as a sheet instead of pushing it via `NavigationLink`, use:
```swift
@State private var isShowingCountryPicker = false

Button("Select Country") {
    isShowingCountryPicker.toggle()
}
.sheet(isPresented: $isShowingCountryPicker) {
    CountryPicker(selectedCountry: $selectedCountry)
}
```

### 5. Handling the Selected Country
Once a country is selected, it is stored in `selectedCountry` and can be used throughout the app.
```swift
if let country = selectedCountry {
    print("Selected country: \(country.name) \(country.flag) with code \(country.phoneCode)")
}
```

## Country JSON Format
Ensure the `countries.json` file is correctly formatted inside the `Resources` folder:
```json
[
    {
        "id": 1,
        "name": "United States",
        "code": "US",
        "flag": "🇺🇸",
        "phoneCode": "+1"
    },
    {
        "id": 2,
        "name": "Canada",
        "code": "CA",
        "flag": "🇨🇦",
        "phoneCode": "+1"
    }
]
```

## Troubleshooting
- **JSON file not loading?** Ensure it is added under `Package.swift` as a resource:
```swift
resources: [
    .process("Resources/countries.json")
]
```
- **Not updating?** Try `File > Swift Packages > Reset Package Caches`.
- **App crashing?** Ensure `phoneCode` values are strings in JSON.

## License
This project is licensed under the MIT License.

## Contributions
Contributions are welcome! Feel free to open a pull request or issue.

## Contact
For support, reach out at gauravharkhani01@gmail.com or open an issue on GitHub.

