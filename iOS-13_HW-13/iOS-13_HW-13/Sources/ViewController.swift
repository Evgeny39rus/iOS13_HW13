import UIKit
import SnapKit

// Enum for identifying setting type
enum SettingType {
    case airplaneMode
    case wifi
    case bluetooth
    case cellular
    case modem
    case vpn
    case notifications
    case sounds
    case doNotDisturb
    case screenTime
    case general
    case controlPoint
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
    
    private var settings: [[Setting]] = [
        [
            Setting(title: "Авиарежим", type: .airplaneMode, icon: UIImage(systemName: "airplane")?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal), isSwitch: true),
            Setting(title: "Wi-Fi", type: .wifi, icon: UIImage(systemName: "wifi")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), isSwitch: false),
            Setting(title: "Bluetooth", type: .bluetooth, icon: UIImage(systemName: "bluetooth")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), isSwitch: false),
            Setting(title: "Сотовая связь", type: .cellular, icon: UIImage(systemName: "antenna.radiowaves.left.and.right")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), isSwitch: false)
        ],
        [
            Setting(title: "Режим модема", type: .modem, icon: UIImage(systemName: "personalhotspot")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), isSwitch: true),
            Setting(title: "VPN", type: .vpn, icon: UIImage(systemName: "network")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal), isSwitch: false)
        ],
        [
            Setting(title: "Уведомления", type: .notifications, icon: UIImage(systemName: "bell.badge")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), isSwitch: true),
            Setting(title: "Звуки, тактильные сигналы", type: .sounds, icon: UIImage(systemName: "speaker.wave.3.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal), isSwitch: false),
            Setting(title: "Не беспокоить", type: .doNotDisturb, icon: UIImage(systemName: "moon.fill")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal), isSwitch: true),
            Setting(title: "Экранное время", type: .screenTime, icon: UIImage(systemName: "hourglass")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal), isSwitch: false)
        ],
        [
            Setting(title: "Основные", type: .general, icon: UIImage(systemName: "gear")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), isSwitch: false),
            Setting(title: "Пункт управления", type: .controlPoint, icon: UIImage(systemName: "slider.horizontal.3")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), isSwitch: false)
        ]
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
            make.top.right.bottom.left.equalToSuperview()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        let setting = settings[indexPath.section][indexPath.row]
        cell.textLabel?.text = setting.title
        cell.imageView?.image = setting.icon
        cell.accessoryView = nil
        cell.accessoryType = .none
        
        if setting.isSwitch {
            let switchControl = UISwitch()
            switchControl.tag = indexPath.section * 100 + indexPath.row
            switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchControl
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        let section = sender.tag / 100
        let row = sender.tag % 100
        let setting = settings[section][row]
        print("\(setting.title) is now \(sender.isOn ? "ON" : "OFF")")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGroupedBackground
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}

