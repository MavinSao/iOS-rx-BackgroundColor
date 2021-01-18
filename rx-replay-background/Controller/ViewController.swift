//
//  ViewController.swift
//  rx-replay-background
//
//  Created by Mavin on 1/18/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadBackgroundColor()
    }
    
    func loadBackgroundColor() {
        var settingVC = self.tabBarController?.viewControllers![3] as! SettingViewController
        settingVC.colorObserver.subscribe(onNext: { [weak self] color in
            self?.view.backgroundColor = color
        })
    }


}

