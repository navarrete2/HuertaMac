//
//  ProductoView.swift
//  HuertaMac
//
//  Created by Miguel  on 10/3/24.
//
import SwiftUI
struct ProductoView: View {
    let producto: Producto

    var body: some View {
        VStack {
            Text(producto.nombre)
            Text(producto.descripcion)
            Text("\(producto.precio)")
            Image(producto.imagen)
        }
    }
}
