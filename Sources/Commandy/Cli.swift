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
}

