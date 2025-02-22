import SwiftUI

struct MandatoryUpdateView: View {
    // Replace this with your actual App Store ID
    let appStoreId = "YOUR_APP_ID"
    
    var body: some View {
        ContentUnavailableView {
            Label("App Update Required", systemImage: "arrow.down.circle")
        } description: {
            Text("This app version is outdated. Please update the app to continue using it.")
        } actions: {
            Button("Update") {
                if let url = URL(string: "itms-apps://apps.apple.com/app/id\(appStoreId)") {
                    UIApplication.shared.open(url)
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MandatoryUpdateView()
}
