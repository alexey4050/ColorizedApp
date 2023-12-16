//
//  ContentView.swift
//  ColorizedApp
//
//  Created by testing on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue: Double = 0.5
    @State private var greenValue: Double = 0.5
    @State private var blueValue: Double = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .frame(width: 350, height: 150)
                    .foregroundStyle(Color(red: redValue, green: greenValue, blue: blueValue, opacity: 1))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth:3))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding()
                
                
                ColorSliderView(value: $redValue, color: .red, label: "Red")
                ColorSliderView(value: $greenValue, color: .green, label: "Green")
                ColorSliderView(value: $blueValue, color: .blue, label: "Blue")
                
                Spacer()
            }
            .background(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.4))
        }
    }
}
#Preview {
    ContentView()
}
