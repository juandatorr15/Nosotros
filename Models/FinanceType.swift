//
//  FinanceType.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import Foundation

enum FinanceType: String, CaseIterable{
    case income = "Ingreso"
    case expense = "Gasto"
}

struct FinanceEntry: Identifiable {
    let id: UUID
    var title: String
    var amount: Double
    var type: FinanceType
    var date: Date
    
    init(title: String, amount: Double, type: FinanceType, date: Date) {
        self.id = UUID()
        self.title = title
        self.amount = amount
        self.type = type
        self.date = date
    }
    
}
