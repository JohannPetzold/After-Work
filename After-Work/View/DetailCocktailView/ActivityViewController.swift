//
//  ActivityViewController.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 07/10/2021.
//

import Foundation
import UIKit
import SwiftUI

// Warnings when using
struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> UIViewController {
            UIViewController()
        }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Create the ActivityViewController
        let activityViewController = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities
        )
        
        // Present if isPresented and no ViewController presented yet
        if isPresented && uiViewController.presentedViewController == nil {
            uiViewController.present(activityViewController, animated: true)
        }
        
        // On dismiss
        activityViewController.completionWithItemsHandler = { (_, _, _, _) in
            isPresented = false
        }
    }
}
