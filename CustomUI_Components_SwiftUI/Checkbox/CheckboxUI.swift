//
//  CheckboxUI.swift
//  CustomUI_Components_SwiftUI
//
//  Created by Sharath Kumar on 09/05/23.
//

import SwiftUI

struct CheckboxUI: View {
    @Binding var isOn: Bool
    @State var checkboxTitle: String
    
    var body: some View {
        HStack {
            Image(uiImage: isOn ? UIImage(named: "checkbox_on")! :
                    UIImage(named: "checkbox_off")!)
            .frame(width: 24.0, height: 24.0)
            .padding(.leading).padding(.top).padding(.bottom)
            Text(checkboxTitle)
                .padding(.trailing)
        }.border(.black, width: 1.0)
            .cornerRadius(2)
            .onTapGesture {
                isOn = !isOn
            }
    }
}

struct CheckboxUI_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxUI(isOn: .constant(true),
                   checkboxTitle: "Hello WorldHello WorldHello WorldHello World")
    }
}
