//
//  Tree_plantingApp.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import SwiftUI
import GoogleMaps
import Firebase
import GoogleSignIn

let APIKey = "AIzaSyDzm1UZF7h2YqWkjBN2Bh078b28XyvEnjw"




// هنا نهيئ الDelegate الخاص فينا للبنية الاساسية عن طريق UIApplicationDelegateAdaptor
@main
struct Tree_plantingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
