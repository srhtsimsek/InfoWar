//
//  InfoWarTableViewIslemleri.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 28.12.2023.
//
import UIKit
// protokoller ile factory
protocol TableViewİslemleriProtocol {
    func update (items: [InfoWarModel])
}
protocol TableViewİslemleriOutputProtocol: AnyObject {
    func onSelected (items: InfoWarModel)
}
//Singleton Tasarım Kalıbı
final class InfoWarTableViewIslemleri: NSObject {
    private lazy var items: [InfoWarModel] = []
    weak var delegate: TableViewİslemleriOutputProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.first?.result?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items.first?.result?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoWarTableViewCellID", for: indexPath) as! InfoWarTableViewCell
        cell.stickOfWar.alpha = 0.5;
        cell.stickOfWar.layer.cornerRadius = 10;
        cell.stickOfSide.alpha = 0.5;
        cell.stickOfSide.layer.cornerRadius = 10;
        cell.warName.text = item?.conflictName
        cell.sideA.text = item?.sideA
        cell.sideB.text = item?.sideB
        cell.deathsA.text = "\(item?.deathsA ?? 0)"
        cell.deathsB.text = "\(item?.deathsB ?? 0)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(items: items[indexPath.row])
    }
}

extension InfoWarTableViewIslemleri: UITableViewDelegate, UITableViewDataSource { }
extension InfoWarTableViewIslemleri: TableViewİslemleriProtocol {
    func update(items: [InfoWarModel]) {
        self.items = items
    }
}
