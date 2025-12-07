//
//  ApplicationMenu.swift
//  Logi Process Killer
//
//  Created by Lo Hoa Tsun Colin on 6/12/2025.
//

import Foundation
import SwiftUI


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
        task.launch()
        task.waitUntilExit()
    }
    
    @objc func about(sender: NSMenuItem) {
        NSApp.orderFrontStandardAboutPanel()
    }
    
    @objc func quit(sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}
