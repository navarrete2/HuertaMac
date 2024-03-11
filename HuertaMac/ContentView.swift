//
//  ContentView.swift
//  HuertaMac
//
//  Created by Miguel  on 10/3/24.
//import SwiftUI

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAppCheck
import FirebaseAnalytics

struct ContentView: View {
    @ObservedObject var productoViewModel = ProductoViewModel()

    var body: some View {
        VStack {
            List(productoViewModel.productos) { producto in
                VStack(alignment: .leading) {
                    Text(producto.nombre).font(.headline)
                    Text(producto.descripcion)
                    Text("\(producto.precio)")
                    
                    // Aquí es donde se muestra la imagen.
                    if let url = URL(string: producto.imagen) {
                        WebImage(url: url)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        // Maneja el caso en que producto.imagen no es una URL válida.
                        // Por ejemplo, podrías mostrar una imagen predeterminada.
                    }
                }
                .onAppear {
                    Analytics.logEvent("producto_visto", parameters: [
                        "nombre": producto.nombre,
                        "descripcion": producto.descripcion,
                        "precio": "\(producto.precio)"
                    ])
                }
            }
            .onAppear() {
                self.productoViewModel.fetchProductos()
                let isAppCheckEnabled = AppCheck.appCheck().isTokenAutoRefreshEnabled
                print("Firebase App Check está habilitado: \(isAppCheckEnabled)")
            }
        }
    }
}
