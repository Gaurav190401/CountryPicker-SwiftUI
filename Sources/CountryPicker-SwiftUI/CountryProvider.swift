//
//  CountryProvider.swift
//  CountryPicker-SwiftUI
//
//  Created by Gaurav Harkhani on 03/03/25.
//

import Foundation

public class CountryProvider {
    @MainActor public static let shared = CountryProvider()
    private init() {}
    
    public func loadCountries() -> [Country] {
        guard let url = Bundle.module.url(forResource: "countries", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([Country].self, from: data)
            return decodedData
        } catch {
            print("Error loading JSON: \(error)")
            return []
        }
    }
}
