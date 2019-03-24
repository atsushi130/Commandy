//
//  Command.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public protocol Command: CaseIterable {
    static var matchOptions: [Self] { get }
    var shortOption: String? { get }
    static func run() throws
}

public extension Command {

    public var name: String {
        return String(describing: type(of: Self.self)).lowercased().kebabcased()
    }

    public static var matchOptions: [Self] {
        return []
    }
    
    public var shortOption: String? {
        return nil
    }
}

public extension Command where Self: RawRepresentable, Self.RawValue == String {
    
    public var option: String {
        let option = self.rawValue.replacingOccurrences(of: "([A-Z])", with: "-$1", options: .regularExpression).lowercased()
        return "--" + option
    }
    
    public static var matchOptions: [Self] {
        
        let options = Arguments.cached.options
        let matchOptions = Self.allCases.filter { `case` in
            if let shortOption = `case`.shortOption {
                return options.contains(`case`.option) || options.contains("-" + shortOption)
            } else {
                return options.contains(`case`.option)
            }
        }
        
        return matchOptions.count == options.count ? matchOptions : []
    }
}

public extension Collection where Iterator.Element: Command, Iterator.Element: Equatable {
    
    public func contains(_ elements: [Iterator.Element]) -> Bool {
        let result = elements.filter { element in
            return self.contains(element)
        }
        return result.count == elements.count
    }
    
    public subscript(_ elements: Iterator.Element...) -> Bool {
        return self.contains(elements) && self.count == elements.count
    }
}
