//
//  ActivityStatus.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import SwiftUI

extension ActivityStatus {

    /// Color representativo del estado
    var color: Color {
        switch self {
        case .pending:
            return .orange
        case .inProgress:
            return .blue
        case .completed:
            return .green
        }
    }

    /// Ícono SF Symbol del estado
    var iconName: String {
        switch self {
        case .pending:
            return "clock"

        case .inProgress:
            return "arrow.triangle.2.circlepath"

        case .completed:
            return "checkmark.circle.fill"
        }
    }
}
