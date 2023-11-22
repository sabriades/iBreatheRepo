//
//  ButtonTimerView.swift
//  iBreathe
//
//  Created by Sabrina Anna Desiderio on 19/11/23.
//

import SwiftUI

struct ButtonTimerView: View {
    @State private var showTimerView = false
    
    var body: some View {
        
        NavigationView {
            
        ZStack{
            Color.black
            .edgesIgnoringSafeArea(.all)
            
            VStack {
              
                NavigationLink(destination: TimerView(), isActive: $showTimerView) {
                               EmptyView()
                           }
                           .hidden()
                
                Button("breathe.") {
                    showTimerView = true
                }
               
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .accessibilityLabel("Breathe button")
                                        .accessibilityHint("Tap to start breathing exercise")
                
                
                Text("tap to start")
                .foregroundColor(.white)
                .accessibilityLabel("Tap to start")
            }
            }
        .navigationBarHidden(true)
       
        }
    }
    }
      



#Preview {
    ButtonTimerView()
}
