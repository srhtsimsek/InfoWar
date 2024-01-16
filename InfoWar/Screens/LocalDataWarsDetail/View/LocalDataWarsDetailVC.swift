//
//  LocalDataWarsDetailVC.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 12.01.2024.
//

import UIKit

class LocalDataWarsDetailVC: UIViewController {
    
    @IBOutlet weak var warNameLabel: UILabel!
    @IBOutlet weak var warInfoTextView: UITextView!
    @IBOutlet weak var totalDeath: UILabel!
    @IBOutlet weak var deathsKidSideA: UILabel!
    @IBOutlet weak var progressKidsSideA: UIProgressView!
    @IBOutlet weak var deathsAdultsideA: UILabel!
    @IBOutlet weak var progressAdultSideA: UIProgressView!
    @IBOutlet weak var deathsSoldierSideA: UILabel!
    @IBOutlet weak var progressSoldierSideA: UIProgressView!
    @IBOutlet weak var nameUlkeA: UILabel!
    @IBOutlet weak var deathsKidSideB: UILabel!
    @IBOutlet weak var progressKidSideB: UIProgressView!
    @IBOutlet weak var deathsAdultSideB: UILabel!
    @IBOutlet weak var progressAdultSideB: UIProgressView!
    @IBOutlet weak var deathsSoldierSideB: UILabel!
    @IBOutlet weak var progressSoldierSideB: UIProgressView!
    @IBOutlet weak var nameCountrySideB: UILabel!
    
    private let jsonService: InfoWarLocalApiService = InfoWarLocalApiService()
    var selectedWar: WarsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperiesValue()
        
        setupProgressBar()
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    func onSelectedWar(items: WarsModel) {
        selectedWar = items
    }
    
    func setupProperiesValue(){
        warNameLabel.text = selectedWar?.warName
        warInfoTextView.text = selectedWar?.warInfo
        nameUlkeA.text = "\(selectedWar?.countrySideA ?? "empty") istatistikleri"
        deathsKidSideA.text = "Çocuk: \(selectedWar?.deathsKidSideA ?? 0)"
        deathsAdultsideA.text = "Yetişkin: \(selectedWar?.deathsAdultSideA ?? 0)"
        deathsSoldierSideA.text = "Asker: \(selectedWar?.deathsSoldierSideA ?? 0)"
        nameCountrySideB.text =  "\(selectedWar?.countrySideB ?? "empty") istatistikleri"
        deathsKidSideB.text = "Çocuk: \(selectedWar?.deathsKidSideB ?? 0)"
        deathsAdultSideB.text = "Yetişkin: \(selectedWar?.deathsAdultSideB ?? 0)"
        deathsSoldierSideB.text = "Asker: \(selectedWar?.deathsSoldierSideB ?? 0)"
    }
    
    func setupProgressBar(){
        guard let selectedWarData = selectedWar else { return }
        var totalDeaths = 0
        if let cocukSideA = selectedWarData.deathsKidSideA, let cocuksideB = selectedWarData.deathsKidSideB, let adultSideA = selectedWarData.deathsAdultSideA, let adultSideB =  selectedWarData.deathsAdultSideB, let soldierSideA = selectedWarData.deathsSoldierSideA, let soldierSideB = selectedWarData.deathsSoldierSideB
        {
            totalDeaths = cocukSideA + cocuksideB + adultSideA + adultSideB + soldierSideA + soldierSideB
            progressKidsSideA.setProgress(Float(cocukSideA)/Float(totalDeaths), animated: true)
            progressKidSideB.setProgress(Float(cocuksideB)/Float(totalDeaths), animated: true)
            progressAdultSideA.setProgress(Float(adultSideA)/Float(totalDeaths), animated: true)
            progressAdultSideB.setProgress(Float(adultSideB)/Float(totalDeaths), animated: true)
            progressSoldierSideA.setProgress(Float(soldierSideA)/Float(totalDeaths), animated: true)
            progressSoldierSideB.setProgress(Float(soldierSideB)/Float(totalDeaths), animated: true)
        }
        totalDeath.text = "Toplam Ölüm Sayısı: \(totalDeaths)"
    }
}
