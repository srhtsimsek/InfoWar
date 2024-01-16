//
//  LocalApiFeedViewController.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 11.01.2024.
//

import UIKit

class LocalApiFeedViewController: UIViewController {

    @IBOutlet weak var localApiFeedCollectionView: UICollectionView!
    
    private let collectionsViewIslemleri: LocalApiFeedCollectionViewIslemleri = LocalApiFeedCollectionViewIslemleri()
    private let jsonService: InfoWarLocalApiService = InfoWarLocalApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initService()
        initDelegate()
    }
    
    private func initDelegate(){
        localApiFeedCollectionView.delegate = collectionsViewIslemleri
        localApiFeedCollectionView.dataSource = collectionsViewIslemleri
        collectionsViewIslemleri.delegate = self
    }
    private func initService(){
        jsonService.readJsonfWarsFile()
        collectionsViewIslemleri.updateWars(items: jsonService.warItems)
        self.localApiFeedCollectionView.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLocalDataFeedDetailVC",
           let selectedWar = sender as? WarsModel,
           let destinationVC = segue.destination as? LocalDataWarsDetailVC {
            destinationVC.onSelectedWar(items: selectedWar)
        }
    }

}

extension LocalApiFeedViewController: CollectionViewIslemleriOutputProtocol{
    func onSelectedWar(items: WarsModel) {
        performSegue(withIdentifier: "toLocalDataFeedDetailVC", sender: items)
    }

}

extension LocalApiFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 16.0 * 2
        let height: CGFloat = 234.0
        return CGSize(width: width, height: height)
    }
}
