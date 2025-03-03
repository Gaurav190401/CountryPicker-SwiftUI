//
//  CountryPicker.swift
//  CountryPicker-SwiftUI
//
//  Created by Gaurav Harkhani on 03/03/25.
//

import SwiftUI

public struct CountryPicker: View {
    @Binding private var selectedCountry: Country?
    @State public var searchText: String = ""
    @Environment(\.presentationMode) private var presentationMode
    
    private let countries: [Country]
    private let searchEnabled: Bool
    
    public init(selectedCountry: Binding<Country?>, searchEnabled: Bool = true) {
        self._selectedCountry = selectedCountry
        self.countries = CountryProvider.shared.loadCountries()
        self.searchEnabled = searchEnabled
    }
    
    public var body: some View {
        List(filteredCountries) { country in
            Button(action: {
                selectedCountry = country
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Text(country.flag)
                    Text(country.name)
                        .font(.body)
                        .foregroundColor(.primary)
                    Text("(\(country.phoneCode))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    if selectedCountry == country {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .navigationTitle("Select Country")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    public var filteredCountries: [Country] {
        let filtered = searchText.isEmpty ? countries : countries.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.phoneCode.contains(searchText)
        }
        
        if let selected = selectedCountry, filtered.contains(selected) {
            return [selected] + filtered.filter { $0 != selected }
        } else {
            return filtered
        }
    }
}
