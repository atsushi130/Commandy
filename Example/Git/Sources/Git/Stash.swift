//
//  Stash.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Commandy

enum Stash: Command {

    typealias Dependency = Void

    static func run() throws {
        return print("git stash")
    }
}
