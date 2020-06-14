//
//  InchToCm.swift
//  ConversionApp
//
//  Created by 荻原美絵 on 2020/06/14.
//  Copyright © 2020 m.ogiwara. All rights reserved.
//

import SwiftUI

struct InchToCm: View {
    @State var strInch = ""
    @State var strCm = ""
    @State var result = ""
    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("inch")) {
                        CustomTextfield(text: $strInch,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input inch")
                    }
                    Section(header: Text("cm")) {
                        CustomTextfield(text: $strCm,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input cm")
                    }
                    
                    Section {
                        Button(action: {
                            self.result = "\(self.strInch) inch = \(self.calculateInchToCm(inch: self.strInch)) cm"
                        }){
                            Text("Convert inch to cm")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                                .frame(width: 350, height: 50, alignment: .center)
                                .shadow(color: Color.gray,radius: 2 ,x: 5, y: 5)
                        }
                        Button(action: {
                            self.result = "\(self.strCm) cm = \(self.calculateCmToInch(cm: self.strCm)) inch"
                        }){
                            Text("Convert cm to inch")
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
                .navigationBarTitle("inch/cm")
            }
        }
        
    
        private func calculateInchToCm(inch:String) -> String {
            let dInch = Double(inch) ?? 0
            return String(dInch * 2.54)
        }
        
        private func calculateCmToInch(cm:String) -> String {
            let dCm = Double(cm) ?? 0
            return String(dCm * 0.393701)
        }
}

struct InchToCm_Previews: PreviewProvider {
    static var previews: some View {
        InchToCm()
    }
}

