//
//  Commit.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/28.
//

import Commandy

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
