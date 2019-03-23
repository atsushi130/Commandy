//
//  CommandyError.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2019/03/23.
//

import Foundation

public enum CommandyError: Error {
    case commandNotFound
    
    var message: String {
        switch self {
        case .commandNotFound:
            return "Command not found."
        }
    }
}
