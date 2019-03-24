//
// Created by Atsushi Miyake on 2019/03/24.
//

import Foundation

extension String {
    func kebabcased() -> String {
        return self.replacingOccurrences(of: "([A-Z])", with: "-$1", options: .regularExpression).lowercased()
    }
}