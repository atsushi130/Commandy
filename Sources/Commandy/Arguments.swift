//
//  Arguments.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public final class Arguments {
    
    public static let cached = Arguments()
    private let arguments: [String] = ProcessInfo.processInfo.arguments.dropFirst().map { $0 }
    
    public subscript(index: Int) -> String? {
        guard self.arguments.count >= index else { return nil }
        return self.arguments[index]
    }
    
    public var command: String? {
        return self.arguments.first
    }
    
    public var options: [String] {
        return self.arguments.filter { $0.contains("-") }
    }
    
    public var nonOptionArguments: [String] {
        return self.arguments.filter { !$0.contains("-") }.dropFirst().map { $0 }
    }
}
