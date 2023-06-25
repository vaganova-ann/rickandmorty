//
//  NSObject+ClassName.swift
//  iosSchoolHH
//
//  Created by Анна on 08.04.2023.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: Self.self)
    }
}
