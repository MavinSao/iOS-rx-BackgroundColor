//
//  ViewController.swift
//  rx-replay-background
//
//  Created by Mavin on 1/18/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let baseURL = "http://newsapi.org/v2/top-headlines?country=us&apiKey=2ddf96179f754f79a560b207d6f8bc1c"

    let disposedBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        loadBackgroundColor()
        fetchArticles()
    }
    
    func loadBackgroundColor() {
        var settingVC = self.tabBarController?.viewControllers![3] as! SettingViewController
        settingVC.colorObserver.subscribe(onNext: { [weak self] color in
            self?.view.backgroundColor = color
        }).disposed(by: disposedBag)
    }
    
    func fetchArticles() {
        
        
        URLRequest.load(resource: ArticlesList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            })
        
        
//        guard let url = URL(string: baseURL) else {return}
        
//        Observable.just(url).flatMap { (url) -> Observable<Data> in
//            let urlRequest = URLRequest(url: url)
//            return URLSession.shared.rx.data(request: urlRequest)
//        }.map { (data) -> [Article]? in
//            return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
//        }.subscribe (onNext: { [weak self] (articles) in
//
//            if let articles = articles {
//                self?.articles = articles
//
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//
//            }
//
//        }).disposed(by: disposedBag)

        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if error != nil {
//                print(error?.localizedDescription)
//            }
//            if let data = data {
//                do{
//                    let articles = try JSONDecoder().decode(ArticlesList.self, from: data).articles
//                    self.articles = articles
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//
//                }catch let error {
//                    print(error.localizedDescription)
//                }
//            }
//        }.resume()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! NewsTableViewCell

        cell.titleLabel.text = articles[indexPath.row].title
        cell.descriptionLabel.text = articles[indexPath.row].description
        
        return cell
    }
    
    
}

