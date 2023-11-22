//
//  ListView.swift
//  iBreathe
//
//  Created by Sabrina Anna Desiderio on 19/11/23.
//
import SwiftUI

struct ListView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                            NavigationLink(destination: ButtonTimerView(), isActive: $isActive) {
                                EmptyView()
                            }
                            .hidden()
      
            ZStack{
                Color.black
                .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    

                                        Button("breathe.") {
                                            isActive = true
                                        }
                     
                     .font(.largeTitle)
                     .foregroundColor(.white)
                     .bold()
                     .padding()
                     .accessibilityLabel("Breathe button")
                                             .accessibilityHint("Tap to start breathing exercise")
                    
                    
                    Button("intervals.") {
                        
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .accessibilityLabel("Intervals button")
                    Button("benefits.") {
                        
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .accessibilityLabel("Benefits button")
                    
                    Button("settings.") {
                        
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    .accessibilityLabel("Settings button")
                    
                    Button("more.") {
                        
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .accessibilityLabel("More button")
                }
            }
            
        
        }
    }
    }
    
}

#Preview {
    ListView()
}

