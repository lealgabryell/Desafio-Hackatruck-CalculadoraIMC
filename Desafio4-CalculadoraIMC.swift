//
//  ContentView.swift
//  CalculadoraIMC
//
//  Created by Turma01-17 on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    @State  var peso: String = ""
    @State  var altura: String = ""
    @State var imc: Double = 0.00
    @State var resultado:String = ""
    @State var color: Color = .white
    
    func calculaIMC(_ pPeso: String, _ pAltura: String) -> Double{
        imc = (Double(pPeso) ?? 0)/((Double(pAltura) ?? 0)*(Double(pAltura) ?? 0))
        return imc
    }
    
    func validar(pImc: Double)->String{
        if(imc<18.50){
        resultado="Baixo Peso"
            color = .lightGreen
        }else if(imc>=18.50 && imc<=24.99){
            resultado="Normal"
            color = .superLightGreen
        }else if(imc>=25.00 && imc<29.99){
            resultado="Sobrepeso"
            color = .lightOrange
        }else if(imc>=30.00){
            resultado="Obesidade"
            color = .darkOrange
        }
        return resultado
    }
    
    var body: some View {
        ZStack{
            
            color.edgesIgnoringSafeArea(.all)
            
            VStack{
                VStack{
                    Text("Calculadora de IMC")
                    TextField("Peso em KG:", text: $peso)
                        .multilineTextAlignment(.center)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background(.white)
                    TextField("Altura em metros", text: $altura)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background(.white)
                    Button("Calcular"){
                        imc = calculaIMC(peso, altura)
                        resultado = validar(pImc: imc)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    Text("Sua classificação é: \n \(resultado)")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                
                Spacer()
                Spacer()
                
                VStack{
                    Image("tabela-IMC")
                        .resizable()
                        .scaledToFit()
                        .frame(width:500)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
