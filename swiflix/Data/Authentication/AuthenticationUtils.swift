//
//  AuthenticationUtils.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/06/24.
//

import UIKit

extension Data {
    var imageFormat: String {
        var values = [UInt8](repeating: 0, count: 1)
        self.copyBytes(to: &values, count: 1)
        switch values[0] {
        case 0xFF:
            return ".jpg"
        case 0x89:
            return ".png"
        case 0x47:
            return ".gif"
        case 0x49, 0x4D:
            return ".tiff"
        default:
            return ""
        }
    }
}
