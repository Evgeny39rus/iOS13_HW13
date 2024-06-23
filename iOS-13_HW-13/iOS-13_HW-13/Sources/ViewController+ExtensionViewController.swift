import UIKit
import SnapKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Setting?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        let typeOfAccessory = Setting?[indexPath.section][indexPath.row].cellType
        
        cell?.setting = Setting?[indexPath.section][indexPath.row]
        
        let switchButton = UISwitch(frame: .zero)
        switchButton.isOn = false
        
        switch typeOfAccessory {
        case .switchButton:
            cell?.accessoryView = switchButton
        case .disclosureIndicator:
            cell?.accessoryType = .disclosureIndicator
        case .none:
            cell?.accessoryType = .none
        case .checkmark:
            cell?.accessoryType = .checkmark
        default:
            break
        }

        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailView()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.setting = ?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

