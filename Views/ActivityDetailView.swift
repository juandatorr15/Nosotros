//
//  ActivityDetailView.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import SwiftUI

struct ActivityDetailView: View {
    
    let activity: Activity
    let onComplete: () -> Void
    
    var body: some View {
        VStack (spacing: 12){
            Text(activity.title).font(.largeTitle).fontWeight(.bold)
            
            Text("Asignado a \(activity.assignedTo)").foregroundStyle(.gray)
            
            Label(activity.status.rawValue, systemImage: activity.status.iconName
                ).foregroundStyle(activity.status.color)
            
            if activity.status != .completed {
                Button("Completar"){
                    onComplete()
                }
            }
        }
    }
}

#Preview {
    ActivityDetailView(activity: Activity(title: "Salvador", expirationDate: Date(), status: .pending, assignedTo: "Juan"), onComplete: {})
}
