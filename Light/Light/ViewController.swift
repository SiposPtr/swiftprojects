//
//  ViewController.swift
//  Light
//
//  Created by Sipos Péter on 2018. 10. 31..
//  Copyright © 2018. Sipos Péter. All rights reserved.
//

// CSAK AZÉRT KELL TÖKÉLETESÍTENI A DARK MODOT HOGY ESETLEG KESOBBIEKBEN LEHESSEN HASZNALNI MAS APPBAN
// illetve unatkozok

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true
    var lightOff = false
    var navigationBarAppearace = UINavigationBar.appearance()
    let mySwitch = UISwitch()
    @IBOutlet var label: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        
        if(sender.isOn == true) {
            mySwitch.isEnabled = true
            print("Dark Mode On")
            fekete()
            
            let uiAlert = UIAlertController(title: "Dark mode bekapcsolva", message: "🌚", preferredStyle: UIAlertController.Style.alert)
            
            self.present(uiAlert, animated: true, completion: nil)
            
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Dark Mode leokézva")
                // az Ok-ra kattintva elmentse azt h épp fekete() -ben van és kövi alkalommal ha megnyitom az appot akkor induljon feketében
            }))
            
        }
            
        else {
            mySwitch.isEnabled = false
            print("Dark Mode Off")
            feher()
            
            let uiAlert = UIAlertController(title: "Dark mode kikapcsolva", message: "🌞", preferredStyle: UIAlertController.Style.alert)
            
            self.present(uiAlert, animated: true, completion: nil)
            
            uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                print("Default Mode leokézva")
            }))
            
        }
    }
    
    // Színek meghatározása
    
    func feher() {
        // statusbar szöveg szine feher ami nem latszodik
        
        view.backgroundColor = lightOn ? .white : UIColor.white
        
        label.textColor = UIColor.black
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .default
        }
        
        navigationBarAppearace.prefersLargeTitles = true
    }
    
    func fekete() {
        // statusbar színe, szövegszíne jó
        // navbar színe nem jó
        
        view.backgroundColor = lightOff ? .black : UIColor.black
        
        label.textColor = UIColor.white
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        navigationBarAppearace.prefersLargeTitles = true
        navigationBarAppearace.barTintColor = UIColor.green
    }
}
