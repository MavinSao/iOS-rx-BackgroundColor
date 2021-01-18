//
//  SettingViewController.swift
//  rx-replay-background
//
//  Created by Mavin on 1/18/21.
//

import UIKit
import RxSwift

class SettingViewController: UIViewController {

    private let colorSubject = ReplaySubject<UIColor>.create(bufferSize: 1)
    var colorObserver : Observable<UIColor> {
        return colorSubject.asObservable()
    }
    
    let disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
  
    @IBAction func colorChangePress(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        
        colorSubject.onNext(color)
        
        colorObserver.subscribe(onNext: { [weak self] color in
            print("work fine")
            self?.view.backgroundColor = color
        }).disposed(by: disposedBag)
        
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
