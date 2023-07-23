//
//  ButtonView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 20/07/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(CustomColor.darkBlue)
            .font(.largeTitle.bold())
            .padding(.vertical, 20)
            .frame(width: 210)
            .background(title != "Kembali" ? CustomColor.brightYellow : .white)
            .cornerRadius(8)
            .shadow(radius: 3, x: 0, y: 3)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Lanjut")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
