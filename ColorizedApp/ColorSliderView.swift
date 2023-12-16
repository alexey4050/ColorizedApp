//
//  ColorSliderView.swift
//  ColorizedApp
//
//  Created by testing on 15.12.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var textFieldValue: String = ""
    @State private var showAlert: Bool = false
    let color: Color
    var label: String
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundStyle(color)
                .frame(width: 50)
            
            Text("\(value, specifier: "%.2f")")
            
            Slider(value: $value, in: 0...1, step: 0.01)
                .tint(color)
            
            TextField("", text: $textFieldValue, onCommit: {
                guard let newValue = Double(textFieldValue) else {
                    showAlert = true
                    return
                }
                if newValue < 0 || newValue > 1 {
                    showAlert = true
                    return
                }
                value = newValue
            })
            .keyboardType(.numbersAndPunctuation)
            .frame(width: 50)
            .background(Color.white)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Ошибка"),
                  message: Text("Please, enter a number between 0 and 1"),
                  dismissButton: .default(Text("OK")))
        })
    }
}

#Preview {
    ColorSliderView(value: Binding.constant(0.5), color: Color.red, label: "Red")
}
