//
//  ContentView.swift
//  QuickCurrency
//
//  Created by Maleesha Kawshan on 2023-03-25.
//
//https://api.exchangerate.host/latest?base=\(base)&amount\(input)

import SwiftUI

struct ContentView: View {
    @State var input = "100"
    @State var base = "USD"
    @State var currencyList = [String]()
    @FocusState private var inputIsFoused: Bool
    
    func makeRquest(showAll: Bool, currencies: [String] = ["USD", "GBP", "EUR"]){
        apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)") { currency in
            var tempList = [String]()
            
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                }else if currencies.contains(currency.key){
                    tempList.append("\(currency.key) \(String(format: "%.2f", currency.value))")
                }
                tempList.sort()
            }
            currencyList.self = tempList
            print(tempList)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("QuickCurrency")
                    .font(.system(size: 30))
                    .bold()
                Image(systemName: "eurosign.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.purple)
            }
            List{
                ForEach(currencyList, id: \.self) { Currency in
                    Text(Currency)
                }
            }
            VStack{
                Rectangle()
                    .frame(height: 8.0)
                    .foregroundColor(.purple)
                    .opacity(0.90)
                TextField("Enter an amount", text: $input)
                    .padding()
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(20.0)
                    .padding()
                    .keyboardType(.decimalPad)
                    .focused($inputIsFoused)
                
                TextField("Enter a currency", text: $base)
                    .padding()
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(20.0)
                    .padding()
                    .focused($inputIsFoused)
                
                Button("convert") {
                    makeRquest(showAll: true, currencies: ["LKR", "SEK", "NOK"])
                    inputIsFoused = false
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.purple)
                .cornerRadius(10)
                .padding()
                
            }
            
        }.onAppear{
            makeRquest(showAll: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
