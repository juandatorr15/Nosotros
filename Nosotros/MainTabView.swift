//
//  MainTabView.swift
//  Nosotros
//
//  Created by Juan Torres  on 7/02/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FinanzasView()
                .tabItem {
                    Label("Mis Finanzas", systemImage: "dollarsign.circle")
                }

            ContentView()
                .tabItem {
                    Label("Actividades", systemImage: "list.bullet.clipboard")
                }

            InformesView()
                .tabItem {
                    Label("Informes", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    MainTabView()
}
