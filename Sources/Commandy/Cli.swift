//
//  Cli.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Foundation

public protocol Cli: CaseIterable {
    var command: String { get }
    var shortCommand: String? { get }
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


enum Git: String, Cli {
    
    case commit
    case stash
    
    func run() throws {
        switch self {
        case .commit: try Commit.run()
        case .stash:  try Stash.run()
        }
    }
}

enum Commit: String, Command {

    case message
    case allowEmpty
    
    var shortOption: String? {
        switch self {
        case .message: return "m"
        default:       return nil
        }
    }

    static func run() throws {
        let matchOptions = Commit.matchOptions
        switch matchOptions {
        case _ where matchOptions[.message]:
            print("git commit -m")
        case _ where matchOptions[.allowEmpty, .message]:
            print("git commit --allow-empty -m")
        default: break
        }
    }
}

struct Stash: Command {
    static func run() throws {
        guard let argument = Arguments.shared.nonOptionArguments.first else {
            return print("git stash")
        }
        print("git stash \(argument)")
    }
}
