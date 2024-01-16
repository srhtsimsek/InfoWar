//
//  ChatGPTViewController.swift
//  InfoWar
//
//  Created by Serhat  Şimşek  on 10.01.2024.
//

import UIKit

class ChatGPTViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    private let field: UITextField = {
        let textField = UITextField()
        textField.placeholder = "InfoWarBot'a savaşlar ile ilgili sorular sorun!"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .secondarySystemBackground
        textField.returnKeyType = .done
        return textField
    }()
    private let table: UITableView = {
        let chatTableView = UITableView()
        chatTableView.translatesAutoresizingMaskIntoConstraints = false
        chatTableView.register(UITableViewCell.self, forCellReuseIdentifier: "chatTableViewCell")
        return chatTableView
    }()
    private var items = [String]()
    var promtQuestions: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(field)
        view.addSubview(table)
        field.delegate = self
        table.delegate = self
        table.dataSource = self
        NSLayoutConstraint.activate([
            field.heightAnchor.constraint(equalToConstant: 50),
            field.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            field.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            field.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            
            table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: field.topAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            items.append(text)
            promtQuestions = text
            fetchResultForPromp(prompt: promtQuestions)
            DispatchQueue.main.async {
                self.table.reloadData()
                textField.text = nil
            }
            //            APICaller.shared.getResponse(input: text) { [weak self] result in
            //                switch result {
            //                case .success(let output):
            //                    self?.items.append(output)
            //                    DispatchQueue.main.async {
            //                        self?.table.reloadData()
            //                        textField.text = nil
            //                    }
            //                case .failure(let error):
            //                    print("failed \(error.localizedDescription)")
            //                }
            //            }
        }
        return true
    }
    private func fetchResultForPromp(prompt: String){
        Task {
            do {
                let answerText = InfoWarChatGptAPICaller().processPrompt(prompt: promtQuestions)
                await MainActor.run {
                    items.append(answerText ?? "")
                }
            } catch {
                print("error")
            }
        }
    }
}
