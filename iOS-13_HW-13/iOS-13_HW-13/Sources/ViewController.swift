import UIKit
import SnapKit

enum SettingType {
    case flymode
    case wifi
    case bluetooth
    case cellular
    
}

struct Setting {
    var title: String
    var type: SettingType
}

class ViewController: UIViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell") // Регистрация типа ячейки
        tableView.dataSource = self // Установка dataSource
        return tableView
    }()
    
    private var settings: [Setting] = [
        Setting(title: "Авиарежим", type: .flymode),
        Setting(title: "Wi-Fi", type: .wifi),
        Setting(title: "Bluetooth", type: .bluetooth),
        Setting(title: "Сотовая связь", type: .cellular)
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
        // Создаем настраиваемый внешний вид для навигационной панели
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()

        // Настройка атрибутов заголовка
        appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.black]

        // Применяем настроенный внешний вид к текущей навигационной панели
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Опционально, если используете большие заголовки
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
        switch setting.type {
        case .flymode, .bluetooth, .wifi, .cellular:
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
