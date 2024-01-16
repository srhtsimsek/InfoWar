//
//  LocalApiFeedCollectionViewIslemleri.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 11.01.2024.
//

import Foundation
import UIKit

protocol CollectionViewIslemleriUpdateProtocol {
    func updateWars (items: [WarsModel])
    
}
protocol CollectionViewIslemleriOutputProtocol: AnyObject {
    func onSelectedWar(items: WarsModel)
    
}

final class  LocalApiFeedCollectionViewIslemleri: NSObject {
    private lazy var warItems: [WarsModel] = []
    
    weak var delegate: CollectionViewIslemleriOutputProtocol?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(warItems.count)
        return warItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WarCell", for: indexPath) as? LocalApiFeedCollectionViewCell {
            cell.warNameLabel.text = warItems[indexPath.row].warName
            cell.warStartDateLabel.text = warItems[indexPath.row].startingDate
            let srcImage = "\(warItems[indexPath.row].warId ?? "1")"
            cell.warImage.image = UIImage(named: srcImage)
            
           // (image: #imageLiteral(resourceName: "Her Kız Kodlayabilir (ft. Nadin)"),
            return cell
        } else {
            print("hata")
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onSelectedWar(items: warItems[indexPath.row])
    }
}

extension LocalApiFeedCollectionViewIslemleri: UICollectionViewDelegate, UICollectionViewDataSource { }
extension LocalApiFeedCollectionViewIslemleri: CollectionViewIslemleriUpdateProtocol {
    func updateWars(items: [WarsModel]) {
        self.warItems = items
    }
}
