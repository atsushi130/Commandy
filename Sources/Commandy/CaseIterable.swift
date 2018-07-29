//
//  CaseIterable.swift
//  Commandy
//
//  Created by Atsushi Miyake on 2018/07/29.
//

public protocol CaseIterable {
    static var allCases: [Self] { get }
}

extension CaseIterable where Self: Hashable {
    
    private static var iterator: AnyIterator<Self> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }
            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Self.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }
    
    public static var allCases: [Self] {
        return Array(self.iterator)
    }
}
