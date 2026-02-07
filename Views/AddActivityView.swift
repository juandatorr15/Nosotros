//
//  AddActivityView.swift
//  Nosotros
//
//  Created by Juan Torres  on 5/02/26.
//

import SwiftUI

struct AddActivityView: View {
    // @Environment(\.dismiss) nos da acceso a una función para cerrar esta vista modal
    @Environment(\.dismiss) private var dismiss

    // @State: variables locales que SwiftUI observa.
    // Cuando cambian, la vista se redibuja automáticamente.
    @State private var title = ""
    @State private var assignedTo = ""
    @State private var expirationDate = Date()

    // Closure que se ejecuta cuando el usuario guarda la actividad.
    // Recibe los datos del formulario para que el ViewModel los procese.
    var onSave: (String, Date, String) -> Void

    var body: some View {
        NavigationStack {
            // Form: crea un formulario nativo con secciones y campos
            Form {
                Section("Detalles") {
                    TextField("Título", text: $title)
                    TextField("Asignado a", text: $assignedTo)
                }

                Section("Fecha límite") {
                    // DatePicker con binding ($) a expirationDate
                    DatePicker("Vence", selection: $expirationDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Nueva Actividad")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        onSave(title, expirationDate, assignedTo)
                        dismiss()
                    }
                    // Deshabilitamos el botón si los campos están vacíos
                    .disabled(title.isEmpty || assignedTo.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddActivityView { title, date, assignedTo in
        print("Guardado: \(title), \(date), \(assignedTo)")
    }
}
