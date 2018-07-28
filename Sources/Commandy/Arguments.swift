//
//  Arguments.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public final class Arguments {
    
    public static let shared = Arguments()
    private let arguments: [String] = ProcessInfo.processInfo.arguments.dropFirst().map { $0 }
    
    public var command: String? {
        return self.arguments.first
    }
}
