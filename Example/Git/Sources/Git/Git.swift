//
//  Git.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Commandy

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
