//
//  Cli.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public protocol Cli {
    var command: String { get }
    var shortCommand: String? { get }
    static var allCases: [Self] { get }
    func run() throws
    init?()
}

public extension Cli where Self: RawRepresentable, Self.RawValue == String {
    
    public var command: String {
        return self.rawValue.replacingOccurrences(of: "([A-Z])", with: "-$1", options: .regularExpression).lowercased()
    }
    
    public var shortCommand: String? {
        return nil
    }
    
    public init?() {
        
        guard let command = Arguments.shared.command else { return nil }
        
        let matches = Self.allCases.filter { `case` in
            return `case`.command == command || `case`.shortCommand  == command
        }
        
        guard let matchCase = matches.first else { return nil }
        self = matchCase
    }

}

