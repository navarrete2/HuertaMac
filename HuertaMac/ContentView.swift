//
//  ContentView.swift
//  HuertaMac
//
//  Created by Miguel  on 10/3/24.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ProductoViewModel()

    var body: some View {
        VStack {
            List(viewModel.productos) { producto in
                VStack(alignment: .leading) {
                    Text(producto.nombre).font(.headline)
                    Text(producto.descripcion)
                    Text("\(producto.precio)")
                }
            }
            .onAppear() {
                self.viewModel.fetchProductos()
            }
        }
    }
}
