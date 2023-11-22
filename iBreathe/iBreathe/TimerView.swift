//
//  TimerView.swift
//  iBreathe
//
//  Created by Sabrina Anna Desiderio on 20/11/23.
//
import SwiftUI

struct TimerView: View {
    

    @State private var countdownValue = 3 // Imposta il valore iniziale del conto alla rovescia
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Timer che aggiorna il conto alla rovescia ogni secondo
    
    var body: some View {
     
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(countdownValue)")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .onReceive(timer) { _ in
                               // Ogni volta che il timer si attiva (ogni secondo), diminuisci il conto alla rovescia
                               if self.countdownValue > 0 {
                                   self.countdownValue -= 1
                           
                               }
                           }
                    .accessibilityLabel("Countdown")
                                       .accessibilityValue("\(countdownValue)")
                           
               
                Text("starting in...")
                .foregroundColor(.white)
                .accessibilityLabel("Starting in...")
             
        }
            
            if self.countdownValue == 0 {
               ContentView()
            }
        
        
        
        }
        .navigationBarHidden(true)

       
        
    }
}

#Preview {
    TimerView()
}
