//
//  RateByAButtonView.swift
//  CoreTemplate
//
//  Created by Hualiteq International on 2024/11/26.
//

import Foundation
import SwiftUI

struct RateByAButtonView: View {
    var body: some View {
        Text("Rate me here!")
            .padding()
            .font(.custom("BrandonGrotesque-Medium", size: 14))
            .frame(minWidth: 80, maxHeight: 30)
            .background(.secondary)
            .foregroundStyle(.blue)
            .cornerRadius(15)
    }
}
