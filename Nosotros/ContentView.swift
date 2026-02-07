//
//  ContentView.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ActivityViewModel()

    // @State controla si el sheet (modal) está visible o no
    @State private var showingAddSheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.activities) { activity in
                    NavigationLink {
                        ActivityDetailView(activity: activity,
                                           onComplete: { viewModel.markAsCompleted(activity) }
                        )
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(activity.title)
                                .font(.headline)

                            Text("Asignado a: \(activity.assignedTo)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)

                            Text(activity.status.rawValue)
                                .font(.caption)
                                .foregroundStyle(
                                    activity.status == .completed ? .green : .orange
                                )
                        }
                    }
                }
            }
            .navigationTitle("Actividades")
            .toolbar {
                Button {
                    showingAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // .sheet presenta una vista modal cuando showingAddSheet es true
            .sheet(isPresented: $showingAddSheet) {
                AddActivityView { title, date, assignedTo in
                    viewModel.addActivity(title: title, expirationDate: date, assignedTo: assignedTo)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
