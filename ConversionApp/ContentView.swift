//
//  ContentView.swift
//  ConversionApp
//
//  Created by 荻原美絵 on 2020/06/14.
//  Copyright © 2020 m.ogiwara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    
    var body: some View {
        TabView (selection: $selection){
            LbsToKg().tabItem{
                VStack{
                    Image(systemName: "car").foregroundColor(.pink)
                    Text("pond/kg")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                }
            }.tag(0)
            InchToCm().tabItem{
                VStack{
                    Image(systemName: "flip.horizontal").foregroundColor(.pink)
                    Text("inch/cm")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                }
            }.tag(1)
            FToC().tabItem{
                VStack{
                    Image(systemName: "thermometer").foregroundColor(.pink)
                    Text("℉/℃")
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
