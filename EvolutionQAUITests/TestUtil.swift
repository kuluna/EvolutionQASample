//
//  TestUtil.swift
//

import Foundation

final class TestUtil {
    static func generateAge() -> Int {
        let ageRange = 18...100
        return ageRange.randomElement()!
    }
}
