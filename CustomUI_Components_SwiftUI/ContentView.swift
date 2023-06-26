//
//  ContentView.swift
//  CustomUI_Components_SwiftUI
//
//  Created by Sharath Kumar on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkBox1State: Bool = false
    @State var checkBox2State: Bool = false
    @State var chckbox1StateTap: Bool = false
    
    var body: some View {
        VStack {
            CheckboxUI(isOn: $checkBox1State, checkboxTitle: "I Accept Terms and condition")
                .padding(.all)
            RadioGroupUI(radioButtons: [.init(title: "Male", isSelected: true, colorProperties: .init(backgroundColor: .white, borderColor: .clear, textColor: .black)),
                                        .init(title: "Female", isSelected: false, colorProperties: .init(backgroundColor: .white, borderColor: .clear, textColor: .black))])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
