//
//  ActivityViewModel.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import SwiftUI

class ActivityViewModel: ObservableObject {

    @Published var activities: [Activity] = []
    
    init() {
        loadMockData()
    }
    
    func loadMockData(){
        let expiration = Calendar.current.date(
            from: DateComponents(year: 2026, month: 3, day: 1)
        )!
        
        activities = [
            Activity(title: "Lavar la loza",
                     expirationDate: expiration,
                     status: .pending,
                     assignedTo: "Juan"),
            Activity(title: "Regar las plantas",
                     expirationDate: expiration,
                     status: .pending,
                     assignedTo: "Cami"),
            Activity(title: "Recoger a Salvador",
                     expirationDate: expiration,
                     status: .completed,
                     assignedTo: "Juan")
        ]
    }
    
    func addActivity(title: String, expirationDate: Date, assignedTo: String){
        let newActivity = Activity(title: title, expirationDate: expirationDate, status: .pending, assignedTo: assignedTo)
        
        activities.append(newActivity)
    }
    
    
    func markAsCompleted(_ activity: Activity) {
        guard let index = activities.firstIndex(where: { $0.id == activity.id }) else {
            return
        }
        activities[index].status = .completed
    }
    
}
