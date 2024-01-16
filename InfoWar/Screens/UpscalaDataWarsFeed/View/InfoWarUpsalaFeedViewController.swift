//
//  InfoWarViewController.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 28.12.2023.
//

import UIKit
class InfoWarUpsalaFeedViewController: UIViewController {
    @IBOutlet weak var warsTableView: UITableView!
    @IBOutlet weak var tableViewActivityIndicator: UIActivityIndicatorView!
    
    private let tableViewIslemleri: InfoWarTableViewIslemleri = InfoWarTableViewIslemleri()
    private let jsonService: InfoWarUpSalaApiService = InfoWarUpSalaApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initService()
        
    }
    
    private func initDelegate(){
        warsTableView.delegate = tableViewIslemleri
        warsTableView.dataSource = tableViewIslemleri
        tableViewIslemleri.delegate = self
    }
    
    private func initService(){
        tableViewActivityIndicator.startAnimating()
        tableViewActivityIndicator.isHidden = false
        
        jsonService.fetchAllPosts { [weak self] (models) in
            self?.tableViewIslemleri.update(items: models)
            self?.warsTableView.reloadData()
            self?.tableViewActivityIndicator.stopAnimating()
            self?.tableViewActivityIndicator.isHidden = true
            } onFail: { (data) in
            print(data?.debugDescription ?? "error")
        }
    }
}

extension InfoWarUpsalaFeedViewController: TableViewİslemleriOutputProtocol {
    func onSelected(items: InfoWarModel) {
        print(items.result ?? "")
    }
}

