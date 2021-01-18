//
//  PersonalViewController.swift
//  rx-replay-background
//
//  Created by Mavin on 1/18/21.
//

import UIKit

class PersonalViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
