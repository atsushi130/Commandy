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
