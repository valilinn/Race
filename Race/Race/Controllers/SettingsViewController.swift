//
//  ViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 08/07/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var previousSettings = SettingsManager.shared.settings
    
    lazy var settings: [Setting] = previousSettings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        
    }

    private func setupTable() {
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {
        let switchSettingNib = UINib(nibName: "SwitchSettingTableViewCell", bundle: Bundle.main)
        tableView.register(switchSettingNib, forCellReuseIdentifier: "switchSettingCell")
        
        let openSettingNib = UINib(nibName: "OpenSettingsTableViewCell", bundle: Bundle.main)
        tableView.register(openSettingNib, forCellReuseIdentifier: "openSettingCell")
    }
    
    
    
    @IBAction func cancelChanges(_ sender: Any) {
        settings = previousSettings
        tableView.reloadData()
    }
    
    
    @IBAction func saveChanges(_ sender: Any) {
        previousSettings = settings
        SettingsManager.shared.settings = settings
        tableView.reloadData()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        if settings[index].type == .switchSetting {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchSettingCell", for: indexPath) as? SwitchSettingTableViewCell else { return UITableViewCell() }
            cell.settingName.text = settings[index].settingName
            cell.`switch`.isOn = (settings[index].settingValue as? Bool) ?? false
            cell.delegate = self
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "openSettingCell", for: indexPath) as? OpenSettingsTableViewCell else { return UITableViewCell() }
            cell.settingName.text = settings[index].settingName
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //1
        tableView.deselectRow(at: indexPath, animated: true)
        
        let index = indexPath.row
        
        switch settings[index].type {
        case .switchSetting:
            guard let cell = tableView.cellForRow(at: indexPath) as? SwitchSettingTableViewCell else { return }
            cell.`switch`.isOn.toggle()
            cell.switchChanged(self)
        case .stringSetting:
            var placeholder = settings[index].settingName
            if let value = settings[index].settingValue as? String, value.count > 0 {
                placeholder = value
            }
            presentAlert(
                title: "Hello",
                message: "Input \(settings[index].settingName)",
                placeholder: placeholder
            ) { [weak self] input in
                self?.settings[index].settingValue = input
            }
        case .openSetting:
            self.present(UIViewController(), animated: true)
        }
        
    }
    
    private func presentAlert(
        title: String,
        message: String,
        placeholder: String = "",
        handler: ((String) -> ())? = nil
    ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alert.addTextField { textfield in
                textfield.placeholder = placeholder
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                guard let text = alert.textFields?.first?.text, text.count > 0 else { return }
                handler?(text)
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            
            present(alert, animated: true)
    }
    
}

extension SettingsViewController: SwitchSettingDelegate {
    func cell(_ cell: SwitchSettingTableViewCell, changeValueTo isOn: Bool) {
        guard let index = tableView.indexPath(for: cell)?.row else { return }
        settings[index].settingValue = isOn
    }
    
    
}
