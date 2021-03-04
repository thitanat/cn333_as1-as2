//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Macintosh HD on 3/3/2564 BE.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }

}
