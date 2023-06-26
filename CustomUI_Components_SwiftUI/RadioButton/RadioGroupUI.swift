//
//  RadioGroupUI.swift
//  CustomUI_Components_SwiftUI
//
//  Created by Sharath Kumar on 26/06/23.
//

import SwiftUI

struct RadioGroupUI: View {
    
    var radioButtons: [RadioButtonProperties]
    @State var selectedRadioButton: RadioButtonProperties? {
        didSet {
            for eachButton in radioButtons {
                eachButton.isSelected = eachButton.title == selectedRadioButton?.title
            }
        }
    }
    
    var body: some View {
        List(radioButtons) { radioButtonProperty in
            HStack {
                Image(buttonIsSelected(radioButtonProperty: radioButtonProperty) ? "radiobutton_on" : "radiobutton_off")
                    .padding(.trailing)
                Text(radioButtonProperty.title)
                    .foregroundColor(radioButtonProperty.colorProperties.textColor)
            }.onTapGesture {
                print("user has selected: \(radioButtonProperty.title)")
                selectedRadioButton = radioButtonProperty
            }
            .padding(.all)
            .border(radioButtonProperty.colorProperties.borderColor)
            .background(radioButtonProperty.colorProperties.backgroundColor)
        }
        .onTapGesture {
            print("tapped here")
        }
    }
    
    private func buttonIsSelected(radioButtonProperty: RadioButtonProperties) -> Bool {
        var isSelected = radioButtonProperty.isSelected
        if let button = selectedRadioButton, button.title == radioButtonProperty.title {
            isSelected = true
        }
        return isSelected
    }
}

struct RadioGroupUI_Previews: PreviewProvider {
    static var previews: some View {
        RadioGroupUI(
            radioButtons:
                [.init(title: "Male", isSelected: true, colorProperties: .init(backgroundColor: .white,                                   borderColor: .red, textColor: .green)),
                 .init(title: "Female", isSelected: false, colorProperties: .init(backgroundColor: .white,                         borderColor: .red, textColor: .green))])
    }
}

class RadioButtonProperties: Identifiable {
    var title: String
    var isSelected: Bool
    var colorProperties: ColorProperties
    
    internal init(title: String, isSelected: Bool,
                  colorProperties: ColorProperties) {
        self.title = title
        self.isSelected = isSelected
        self.colorProperties = colorProperties
    }
}


struct ColorProperties {
    var backgroundColor: Color
    var borderColor: Color
    var textColor: Color
    var tintColor = Color.clear
}
