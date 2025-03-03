import XCTest
@testable import CountryPicker_SwiftUI

final class CountryPickerTests: XCTestCase {
    @MainActor func testFilterCountries() {
        let countries = [
            Country(id: 1, name: "United States", code: "US", flag: "🇺🇸", phoneCode: "+1"),
            Country(id: 2, name: "India", code: "IN", flag: "🇮🇳", phoneCode: "+91")
        ]
        let picker = CountryPicker(selectedCountry: .constant(nil))
    }
}
