//
//  PerferenceKeys.swift
//  DesignCodeiOS15
//
//  Created by 支天白 on 2022/6/26.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
