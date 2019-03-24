//
//  Cli.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public protocol Cli: CaseIterable {
    var command: String { get }
    func run() throws
    init() throws
}

public extension Cli where Self: RawRepresentable, Self.RawValue == String {

    public static var name: String {
        return String(describing: self).lowercased().kebabcased()
    }

    public var command: String {
        return self.rawValue.kebabcased()
    }
    
    public init() throws {
        
        guard let command = Arguments.cached.command else { throw CommandyError.commandNotFound }
        
        let matches = Self.allCases.filter { `case` in
            return `case`.command == command
        }
        
        guard let matchCase = matches.first else { throw CommandyError.commandNotFound }
        self = matchCase
    }
}
