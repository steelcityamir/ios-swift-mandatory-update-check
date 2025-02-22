//
//  AppView.swift
//  Mandatory Update Check
//
//  Created by Amir Boroumand on 2/22/25.
//

import SwiftUI

struct AppView: View {
    @State private var versionCheck = VersionCheckManager()
    
    var body: some View {
        Group {
            if versionCheck.isUpdateRequired {
                MandatoryUpdateView()
            } else {
                ContentView()
            }
        }
        .onAppear {
            versionCheck.checkForUpdate()
        }
    }
}
