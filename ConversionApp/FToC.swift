//
//  FToC.swift
//  ConversionApp
//
//  Created by 荻原美絵 on 2020/06/14.
//  Copyright © 2020 m.ogiwara. All rights reserved.
//

import SwiftUI

struct FToC: View {
    @State var strF = ""
    @State var strC = ""
    @State var result = ""
    
    var body: some View {
     NavigationView {
                Form {
                    Section(header: Text("℉")) {
                        CustomTextfield(text: $strF,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input ℉")
                    }
                    Section(header: Text("℃")) {
                        CustomTextfield(text: $strC,keyType: UIKeyboardType.decimalPad, placeHolder: "Please input ℃")
                    }
                    
                    Section {
                        Button(action: {
                            self.result = "\(self.strF) ℉ = \(self.calculateFtoC(f: self.strF)) ℃"
                        }){
                            Text("Convert ℉ to ℃")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                                .frame(width: 350, height: 50, alignment: .center)
                                .shadow(color: Color.gray,radius: 2 ,x: 5, y: 5)
                        }
                        Button(action: {
                            self.result = "\(self.strC) ℃ = \(self.calculateCtoF(c: self.strC)) ℉"
                        }){
                            Text("Convert ℃ to ℉")
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
                .navigationBarTitle("℃/℉")
            }
        }
        
        private func calculateFtoC(f:String) -> String {
            let dF = Double(f) ?? 0
            return String((dF - 32) * 5 / 9)
        }
        
        private func calculateCtoF(c:String) -> String {
            let dC = Double(c) ?? 0
            return String((dC * 9 / 5) + 32)
        }
}

struct FToC_Previews: PreviewProvider {
    static var previews: some View {
        FToC()
    }
}
