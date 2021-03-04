//
//  Array+Only.swift
//  Memorize
//
//  Created by Macintosh HD on 4/3/2564 BE.
//

import Foundation

extension  Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
