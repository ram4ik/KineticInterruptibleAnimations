//
//  SpringThrowView.swift
//  KineticInterruptibleAnimations
//
//  Created by Ramill Ibragimov on 9/26/23.
//

import SwiftUI

struct SpringThrowView: View {

    @State var offset: CGSize = .zero

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.blue)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(dragGesture)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                }
            }
    }
}

#Preview {
    SpringThrowView()
}
