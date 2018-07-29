//
//  Command.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public protocol Command: CaseIterable {
    func run() throws
}

public extension Command where Self: RawRepresentable, Self.RawValue == String {
    
    public var option: String {
        let option = self.rawValue.replacingOccurrences(of: "([A-Z])", with: "-$1", options: .regularExpression).lowercased()
        let splitedOption = option.split(separator: "-")
        
        if splitedOption.count >= 2 {
            return "--" + option
        } else {
            return "-" + option
        }
    }
    
    static var command: Self? {
        return self.options.first
    }
    
    static var options: [Self] {
        let options = Arguments.shared.options
        return Self.allCases.filter { `case` in
            return options.contains(`case`.option)
        }
    }
}


