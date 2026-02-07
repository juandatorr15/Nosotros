//
//  FinanzasView.swift
//  Nosotros
//
//  Created by Juan Torres  on 7/02/26.
//

import SwiftUI

struct FinanzasView: View {
    var body: some View {
        NavigationStack {
            Text("Mis Finanzas")
                .font(.title)
                .navigationTitle("Mis Finanzas")
        }
    }
}

#Preview {
    FinanzasView()
}
