//
//  ContentView.swift
//  iBreathe
//
//  Created by Sabrina Anna Desiderio on 14/11/23.
//


import SwiftUI

struct ContentView: View {
    //Definisco la proprietà di stato. Vuol dire che quando lo stato cambia, cambia la vista SwiftUI
   
    
    
    @State private var progress: Double = 0.0
    @State private var timerIsRunning = false
    @State private var inhaleTextOpacity: Double = 1.0
    @State private var holdTextOpacity: Double = 1.0
    @State private var HbarOpacity: Double = 1.0
    @State private var circularProgressBarOpacity: Double = 1.0
     //All'inizio la barra di Progresso di exhale non compare
   /* @State private var breatheTextOpacity: Double = 1.0 */

    private let totalTime = 8.0  // Imposta il tempo totale del timer in secondi
    
    var body: some View {
       NavigationView {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            NavigationLink(destination: ButtonTimerView(), isActive: $timerIsRunning) {
                EmptyView()
            }
            .hidden()
            VStack {
                ZStack {
                    Circle()
                     /*  .stroke(lineWidth: 20.0)
                        .opacity(0.3) */
                    
                        .foregroundColor(Color(red: 0.165, green: 0.165, blue: 0.165))
                    //Cerchio 1
                    Circle()
                    //trim FA FUNZIONARE LA BARRA DI PROGRESSO
                       /* .trim(from: 0.0, to: CGFloat(progress)) */
                    /* rendo il riempimento della barra antiorario per questo primo cerchio e ho impostato il punto di partenza eguale per i due cerchi, ovvero a 90°*/
                        .trim(from: CGFloat(1.0 - progress), to: 1.0)
                        
                    
                    //stroke mi dà la linietta della barra di progresso
                        .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.white)  // Colore della progress bar
                        
                    //rotationEffect per cominciare il riempimento della linea di progresso dal basso
                    
                        .rotationEffect(Angle(degrees: 90))
                        .opacity(circularProgressBarOpacity)
                    // Circle 2 - Riempimento da sinistra a destra
                                Circle()
                                .trim(from: 0.0, to: CGFloat(progress))
                                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                                 .foregroundColor(.white)
                                            .rotationEffect(Angle(degrees: 90))
                                            .opacity(circularProgressBarOpacity)
                                           
                    
                    Text("inhale.")
                    .font(.system(size: 15 + CGFloat(progress) * 30))  // Scala la dimensione del testo
                        .foregroundColor(.white)
                        .opacity(inhaleTextOpacity)
                        .accessibilityLabel("Inhale")
                        .accessibilityHint("Inhale deeply")
                        
                    
                    Text("hold.")
                    .foregroundColor(.white)
                   .opacity(inhaleTextOpacity == 0 ? 1 : 0)
                    //.font(.title) aumenta la dimensione del testo
                    .opacity(holdTextOpacity)
                    .font(.title)
                    .accessibilityLabel("Hold")
                    .accessibilityHint("Hold your breath")
                    
                    //BARRA ORIZZONTALE:
                    
                    Rectangle()
                    .fill(Color.white)
                    .frame(width: CGFloat(progress) * 80, height: 5) // Larghezza proporzionale al progress
                     .offset(x: 0, y: 30)
                    //HO FATTO COMPARIRE LA BARRA DOPO.
                    //dico che se inhaleTextOp è pari a 0, allora deve diventare 1 altrimenti 0.
                    .opacity(inhaleTextOpacity == 0 ? 1 : 0)
                     .opacity(HbarOpacity)
                    
                    
                    /* Text("breathe.")
                                        
                        .font(.system(size: 15 + CGFloat(progress) * 30))  // Scala la dimensione del testo
                        .foregroundColor(.white)
                        .opacity(breatheTextOpacity) */

                    //progress > 0.0 per mostrare il testo sin dall'inizio, ma più piccolo e poi il testo aumenta in dimensione. tramite il comando opacity posso regolare l'opacità di un elemento.
                    
                    /* l'opacità della scritta "Complete" viene impostata a 0.0 (trasparente) quando progress è inferiore o uguale a 0.0, e a 1.0 (opaca) quando progress è maggiore di 0.0. Questo è utile per fare in modo che il testo diventi visibile solo dopo che la barra di progressione ha iniziato a riempirsi. L'operatore ternario ? : è una forma concisa di if-else che restituisce 1.0 se la condizione è vera e 0.0 se è falsa. */
                    
                    /* Text("\(Int(totalTime - progress * totalTime))")  // Visualizza il conto alla rovescia
                        .font(.largeTitle)
                        .foregroundColor(.white) */
                    
                    Text("exhale.")
                       
                      /*  .font(.system(size: 40 + CGFloat(progress) * 20)) */
                        .font(.system(size: 15 + CGFloat(progress) * 30))
                        .foregroundColor(.white)
                        .font(.title)
                        .opacity(holdTextOpacity == 0 ? 1 : 0)
                        .accessibilityLabel("Exhale")
                                                    .accessibilityHint("Exhale slowly")
                                                  
                
                      /*   .trim(from: CGFloat(1.0 - Eprogress), to: 1.0)
                                           .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                                           .foregroundColor(.white)
                                           .rotationEffect(Angle(degrees: 90))
                                           .opacity(circularProgressBarOpacity * Eprogress) */
                }
                
                
                .frame(width: 200, height: 200)
                /* .onAppear in SwiftUI viene utilizzato per eseguire un blocco di codice quando la vista appare per la prima volta sulla schermata. */
                
                .onAppear {
                    startTimer()
                               }
          
                
               /* Button(action: {
                    startTimer()
                }) {                    Text(timerIsRunning ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                } */
            }
            
        }
            
       }
    }
    
   /* private func startTimer() {
        if timerIsRunning {
            resetTimer()
        } else {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation {
                    progress += 0.1 / totalTime
                    if progress >= 1.0 {
                        resetTimer()
                    }
                    
                    inhaleTextOpacity = progress > 0.5 ? 0 : 1
                   //opacità di hold:
                   /* holdOpacity = progress */
                    holdTextOpacity = progress >= 1.0 ? 0 : 1
                    HbarOpacity = holdTextOpacity
                    
                  //Faccio ricomparire il cerchio completo
                    /*  circularProgressBarOpacity = holdTextOpacity == 0 ? 0 : 1 */
                   
                }
            }
        }
      
 
       /* timerIsRunning.toggle() */
    }*/
    
 
    private func startTimer() {
        if timerIsRunning {
            //resetTimer()
        } else {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation {
                    progress += 0.1 / totalTime
                    inhaleTextOpacity = progress > 0.5 ? 0 : 1
                    holdTextOpacity = progress >= 0.85 ? 0 : 1
                    HbarOpacity = holdTextOpacity

                    if progress >= 0.85 {
                        //resetTimer()
                        timer.invalidate()
                        // Attendi 4 secondi prima di iniziare a diminuire progress
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { decreasingTimer in
                                withAnimation {
                                    progress -= 0.01
                                    if progress <= 0 {
                                        // Assicurati che la variabile Progress non sia mai inferiore a 0
                                        progress = 0
                                        decreasingTimer.invalidate()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    private func resetTimer() {
        progress = 1.0
       
        //prima avevo messo la progressione a 0.0, ovvero la barra continuava a riempirsi in loop. invece così (ponendo = 1.0) l'animazione si blocca quando la barra di progresso circolare raggiunge il 100%
        
        /* inhaleTextOpacity = 1.0 */
        
       /* newTextOpacity = 0.0 */
        /* timerIsRunning.toggle() */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    
    }
}
