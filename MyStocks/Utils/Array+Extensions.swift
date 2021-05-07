//
//  Array+Extensions.swift
//  MyStocks
//
//  Created by Scott Bolin on 27-Apr-21.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
