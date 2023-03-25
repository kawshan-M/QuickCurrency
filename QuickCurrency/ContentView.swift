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
    
    var body: some View {
        Text("hello world!")
        .padding()
        .onAppear {
            apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)") { currency
                in
                //print(currency)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
