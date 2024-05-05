//
//  ContentView.swift
//  240504 Tarea API Citas
//
//  Created by Luis on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var datosViewModel = DatosViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Image("fondoballenas")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Spacer()
                        
                        Text(datosViewModel.datos?.content ?? "")
                            .font(.title2)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.5))
                                .overlay(                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                )
                            )
                            .padding(.bottom)
                        VStack(alignment: .leading) {
                            Text("- Autor: \(datosViewModel.datos?.author ?? "")")
                                .font(.title2)
                                .padding(5)
                            
                            Text("- Longitud: \(datosViewModel.datos?.length ?? 0)")
                                .font(.title2)
                                .padding(5)
                            Text("- Cita agregada: \(datosViewModel.datos?.dateAdded ?? "")")
                                .font(.title2)
                                .padding(5)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray, lineWidth: 3)
                                    )
                            )
                        Spacer()
                    }
                }
            }
            .multilineTextAlignment(.trailing)
            .padding()
        .onAppear(perform: datosViewModel.llamaUrl)
            
            HStack {
                Spacer()
                Button(action: datosViewModel.llamaUrl){
                    Image(systemName: "arrow.clockwise")
                }
                .font(.title)
                .foregroundColor(.black)
                .padding(.top)
                
                Spacer()
                
                Button(action: {
                    self.datosViewModel.leerTexto(texto: datosViewModel.datos?.content ?? "")
                }) {
                    Text("Read")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.top)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
