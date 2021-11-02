//
//  ContentView.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import SwiftUI
import GoogleMaps
import Firebase
import GoogleSignIn
import Lottie


struct ContentView: View {
    @ObservedObject  var myLocation = LocationManager()
  

    
    var body: some View {
        
   treeview()

        
  // خارطة قوقل
//GoogleMapsView()
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct treeview : View {
    @State var show = false
    var body: some View {
        
        VStack {
            
            ZStack {
                
                Color("background")
                    .ignoresSafeArea(.all)
                VStack {
                    AnimatedView(show: $show)
                        // default Frame
                        .frame(height: UIScreen.main.bounds.height / 2)
                    Text("مبادرة زراعة الاشجار")
                        .font(.title)
                        .foregroundColor(Color.green)
                    Divider()
                    Text("اقترح مكان مناسب على الخارطة لزرع الاشجار")
                    
                    Spacer()
                    Text("سجل دخولك من حساب قوقل وابدأ")
                    
                    
                    
                    google()
                        
                        .frame(width: 150, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       
                    
                    
                }
                
            }
        }
    }
    
    
    // Animation
    struct AnimatedView: UIViewRepresentable {
        
        @Binding var show: Bool
        func makeUIView(context: Context) -> AnimationView {
            let view = AnimationView(name: "tree", bundle: Bundle.main)
            view.play { (status) in
                if status {
                    
                    // toggling view
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                        show.toggle()
                    }
                }
            }
            return view
        }
        
        func updateUIView(_ uiView: AnimationView, context: Context) {
            
        }
    }
}


struct google : UIViewRepresentable {
    
    
    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        
        
    }
    
    
}
