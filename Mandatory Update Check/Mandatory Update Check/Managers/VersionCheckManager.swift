//
//  VersionCheckManager.swift
//  Mandatory Update Check
//
//  Created by Amir Boroumand on 2/22/25.
//


import SwiftUI

class VersionCheckManager: ObservableObject {
    @Published var isUpdateRequired: Bool = false
    private let remoteURL = URL(string: "https://raw.githubusercontent.com/steelcityamir/ios-swift-mandatory-update-check/main/Mandatory%20Update%20Check/Mandatory%20Update%20Check/minimum-version.json")!
    
    func checkForUpdate() {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let currentVersion = infoDictionary["CFBundleShortVersionString"] as? String else {
            print("Failed to get app version")
            return
        }
        
        fetchRemoteVersion { [weak self] minVersion in
            guard let self = self, let minVersion = minVersion else { return }
            
            if self.isVersionOutdated(currentVersion, minVersion) {
                DispatchQueue.main.async {
                    self.isUpdateRequired = true
                }
            }
        }
    }
    
    private func fetchRemoteVersion(completion: @escaping (String?) -> Void) {
        URLSession.shared.dataTask(with: remoteURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch remote version: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let minVersion = json["minimumVersion"] as? String {
                    completion(minVersion)
                } else {
                    completion(nil)
                }
            } catch {
                print("JSON parsing error: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    private func isVersionOutdated(_ current: String, _ minimum: String) -> Bool {
        return current.compare(minimum, options: .numeric) == .orderedAscending
    }
}
