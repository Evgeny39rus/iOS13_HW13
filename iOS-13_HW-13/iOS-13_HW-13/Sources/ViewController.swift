import UIKit
import SnapKit

// Enum for identifying setting type
enum SettingType {
    case airplaneMode
    case wifi
    case bluetooth
    case cellular
    case notifications
}

// Struct for holding the details of each setting
struct Setting {
    var title: String
    var type: SettingType
    var icon: UIImage?
    var isSwitch: Bool
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private var settings: [Setting] = [
        Setting(title: "Авиарежим", type: .airplaneMode, icon: UIImage(systemName: "airplane"), isSwitch: true),
        Setting(title: "Wi-Fi", type: .wifi, icon: UIImage(systemName: "wifi"), isSwitch: false),
        Setting(title: "Bluetooth", type: .bluetooth, icon: UIImage(systemName: "bluetooth"), isSwitch: false),
        Setting(title: "Сотовая связь", type: .cellular, icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), isSwitch: false),
        Setting(title: "Уведомления", type: .notifications, icon: UIImage(systemName: "bell.badge"), isSwitch: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = false
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
        cell.imageView?.image = setting.icon
        cell.accessoryView = nil
        cell.accessoryType = .none
        
        if setting.isSwitch {
            let switchControl = UISwitch()
            switchControl.tag = indexPath.row
            switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchControl
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        let setting = settings[sender.tag]
        print("\(setting.title) is now \(sender.isOn ? "ON" : "OFF")")
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let setting = settings[indexPath.row]
        if !setting.isSwitch {
            // Handle navigation to detail settings screen
            print("Navigate to settings detail for \(setting.title)")
        }
    }
}

