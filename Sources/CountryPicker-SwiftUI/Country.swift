//
//  Country.swift
//  CountryPicker-SwiftUI
//
//  Created by Gaurav Harkhani on 03/03/25.
//

import SwiftUI

public struct Country: Identifiable, Equatable, Codable {
    public let id: Int
    public let name: String
    public let code: String
    public let flag: String
    public let phoneCode: String
}
