//
//  ViewController.swift
//  flutter_addtoapp_basic_ios
//
//  Created by Joshua de Guzman on 22/11/2019.
//  Copyright © 2019 Joshua de Guzman. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btLoadFlutterScreen(_ sender: Any) {
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            flutterViewController.setInitialRoute("/flutter-screen")
            self.present(flutterViewController, animated: false, completion: nil)
        }
    }
}

