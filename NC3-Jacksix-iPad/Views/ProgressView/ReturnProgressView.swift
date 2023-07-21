//
//  ReturnProgressView.swift
//  NC3-Jacksix-iPad
//
//  Created by Yuga Samuel on 21/07/23.
//

import SwiftUI

struct ReturnProgressView: View {
    let firstColor: Color
    let secondColor: Color
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Circle()
                    .foregroundColor(firstColor)
                Text("1")
                    .foregroundColor(CustomColor.darkBlue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaleEffect(2)
            }
            
            Rectangle()
                .frame(height: 5)
            
            ZStack {
                Circle()
                    .foregroundColor(secondColor)
                Text("2")
                    .foregroundColor(CustomColor.darkBlue)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaleEffect(2)
                
            }
        }
        .shadow(radius: 5, y: 3)
        .frame(width: 450, height: 65)
    }
}

struct ReturnProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnProgressView(firstColor: CustomColor.brightYellow, secondColor: CustomColor.teal)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
