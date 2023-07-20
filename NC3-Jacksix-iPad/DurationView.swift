//
//  DurationView.swift
//  NC3-Jacksix-iPad
//
//  Created by Jason Leonardo on 20/07/23.
//

import SwiftUI

struct DurationView: View {
    @State private var selectedDuration = 1
    let durationList = Array(1...48)
    
    var body: some View {
        VStack {
            Text("Sesuaikan durasi dan ukuran loker yang Anda butuhkan!")
                .font(.system(size: 45))
                .multilineTextAlignment(.center)
                .bold()
                .padding(40)
            
            HStack{
                Text("Durasi")
                    .font(.system(size: 35))
                    .padding(.horizontal, 100)
                
                Picker("Durasi", selection: $selectedDuration) {
                    ForEach(durationList, id: \.self) { duration in
                        Text("\(duration) Jam")
                        
                    }
                }
                .scaleEffect(2)
                .frame(width: 250)
                .padding()
            }
            .background(Color("okTeal"))
            .cornerRadius(15)
            
            
        }
    }
}

struct DurationView_Previews: PreviewProvider {
    static var previews: some View {
        DurationView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
