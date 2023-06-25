// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum ApiError {
    /// Parsing error!
    internal static let parsing = L10n.tr("Localizable", "api-error.parsing", fallback: "Parsing error!")
    /// Server error!
    internal static let server = L10n.tr("Localizable", "api-error.server", fallback: "Server error!")
    /// Oops! Unknown error
    internal static let unknown = L10n.tr("Localizable", "api-error.unknown", fallback: "Oops! Unknown error")
  }
  internal enum Locations {
    /// There are %d residents
    internal static func population(_ p1: Int) -> String {
      return L10n.tr("Localizable", "locations.population", p1, fallback: "There are %d residents")
    }
  }
  internal enum Navbar {
    internal enum Title {
      /// Favorites
      internal static let favorites = L10n.tr("Localizable", "navbar.title.favorites", fallback: "Favorites")
      /// Locations
      internal static let locations = L10n.tr("Localizable", "navbar.title.locations", fallback: "Locations")
    }
  }
  internal enum Tabbar {
    /// Favorites
    internal static let favorites = L10n.tr("Localizable", "tabbar.favorites", fallback: "Favorites")
    /// Localizable.strings
    ///   rickandmorty
    /// 
    ///   Created by Анна on 20.06.2023.
    internal static let locations = L10n.tr("Localizable", "tabbar.locations", fallback: "Locations")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
