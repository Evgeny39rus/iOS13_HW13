import UIKit
import SnapKit

// Enum for identifying setting type
enum SettingType {
    case bluetooth
    case wifi
    case notifications
}

// Struct for holding the details of each setting
struct Setting {
    var title: String
    var type: SettingType
}

class ViewController: UIViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    private var settings: [Setting] = [
        Setting(title: "Bluetooth", type: .bluetooth),
        Setting(title: "Wi-Fi", type: .wifi),
        Setting(title: "Notifications", type: .notifications)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupHierarchy()
        setupLayout()
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        let setting = settings[indexPath.row]
        cell.textLabel?.text = setting.title
        switch setting.type {
        case .bluetooth, .wifi, .notifications:
            let switchControl = UISwitch()
            switchControl.tag = indexPath.row
            switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchControl
        }
        return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        let setting = settings[sender.tag]
        print("\(setting.title) is now \(sender.isOn ? "ON" : "OFF")")
    }
}

