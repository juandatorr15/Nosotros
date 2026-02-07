//
//  Activity.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import Foundation

enum ActivityStatus: String, CaseIterable {
    case pending = "Pendiente"
    case inProgress = "En progreso"
    case completed = "Completada"
}

struct Activity: Identifiable {
    let id: UUID
    var title: String
    var expirationDate: Date
    var createdAt: Date
    var status: ActivityStatus
    var assignedTo: String
    
    init(title: String, expirationDate: Date, status: ActivityStatus, assignedTo: String) {
        self.id = UUID()
        self.title = title
        self.expirationDate = expirationDate
        self.createdAt = Date()
        self.status = status
        self.assignedTo = assignedTo
    }
}
