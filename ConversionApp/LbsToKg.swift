//
//  LbsToKg.swift
//  ConversionApp
//
//  Created by 荻原美絵 on 2020/06/14.
//  Copyright © 2020 m.ogiwara. All rights reserved.
//

import SwiftUI

struct LbsToKg: View {
    @State var strPonds = ""
    @State var strKgs = ""
    @State var result = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pound")) {
                    CustomTextfield(text: $strPonds,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input pond")
                }
                Section(header: Text("Kg")) {
                    CustomTextfield(text: $strKgs,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input kg")
                }
                
                Section {
                    Button(action: {
                        self.result = "\(self.strPonds) pond = \(self.calculateLbsToKgs(ponds: self.strPonds)) kg"
                    }){
                        Text("Convert Pond to Kg")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .frame(width: 350, height: 50, alignment: .center)
                            .shadow(color: Color.gray,radius: 2 ,x: 5, y: 5)
                    }
                    Button(action: {
                        self.result = "\(self.strKgs) kg = \(self.calculateKgsToLbs(kgs: self.strKgs)) pond"
                    }){
                        Text("Convert Kg to Pond")
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .frame(width: 350, height: 50, alignment: .center)
                            .shadow(color: Color.gray,radius: 5 ,x: 5, y: 5)
                    }
                    
                }
                
                Section(header: Text("Result")) {
                    Text(result)
                }
            }
            .navigationBarTitle("pound/kg")
        }
    }
    
    private func calculateLbsToKgs(ponds:String) -> String {
        let dPonds = Double(ponds) ?? 0
        guard dPonds == 0 else {
            return String(dPonds / 0.45359293319936)
        }
        return String(dPonds)
    }
    
    private func calculateKgsToLbs(kgs:String) -> String {
        let dKgs = Double(kgs) ?? 0
        return String(dKgs * 0.45359293319936)
    }
    
}

struct LbsToKg_Previews: PreviewProvider {
    static var previews: some View {
        LbsToKg()
    }
}

