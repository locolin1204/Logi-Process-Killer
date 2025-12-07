//
//  ApplicationMenu.swift
//  Logi Process Killer
//
//  Created by Lo Hoa Tsun Colin on 6/12/2025.
//

import Foundation
import SwiftUI
import UserNotifications

class ApplicationMenu: NSObject {
    
    let menu = NSMenu()
    
    func createMenu() -> NSMenu {
        
        let killProcessMenuItem = NSMenuItem(
            title: "Kill Logi Process",
            action: #selector(killProcess),
            keyEquivalent: ""
        )
        killProcessMenuItem.target = self
        menu.addItem(killProcessMenuItem)
        
        menu.addItem(NSMenuItem.separator())
        
        let aboutMenuItem = NSMenuItem(
            title: "About Logi Process Killer",
            action: #selector(about),
            keyEquivalent: ""
        )
        aboutMenuItem.target = self
        menu.addItem(aboutMenuItem)
        
        menu.addItem(NSMenuItem.separator())
        
        let quitMenuItem = NSMenuItem(
            title: "Quit",
            action: #selector(quit),
            keyEquivalent: "q"
        )
        quitMenuItem.target = self
        menu.addItem(quitMenuItem)
        
        return menu
    }
    
    @objc func killProcess(sender: NSMenuItem) {
        let pipe = Pipe()
        let task = Process()
        
        task.launchPath = "/usr/bin/killall"
        task.arguments = ["LogiMgrDaemon"]
        
        task.standardOutput = pipe
        task.standardError = pipe
        
        do {
            try task.run()
        } catch {
            print("Failed to launch task: \(error)")
            showNotification(title: "System Error", body: "Could not launch the kill command.")
            return
        }
        
        task.waitUntilExit()
        
        // Check termination status
        // 0 = Success (Process found and killed)
        // 1 = Failure (Usually means 'No matching processes belonging to you were found')
        
        let applicationName = "Logi Options Daemon"
        if task.terminationStatus == 0 {
            showNotification(title: "Success", body: "\(applicationName) terminated.")
        } else {
            showNotification(title: "Process Not Found", body: "\(applicationName) is not running or already terminated.")
        }
    }
    
    private func showNotification(title: String, body: String) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.sound = UNNotificationSound.default
                
                // UUID ensures every notification is treated as a new event
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
                
                center.add(request) { error in
                    if let error = error {
                        print("Error showing notification: \(error.localizedDescription)")
                    }
                }
            } else if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
