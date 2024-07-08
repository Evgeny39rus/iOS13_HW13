import UIKit
import SnapKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?[section].count ?? 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        let typeOfAccessory = settings?[indexPath.section][indexPath.row].cellType
        
        cell?.setting = settings?[indexPath.section][indexPath.row]
        
        let switchButton = UISwitch(frame: .zero)
        switchButton.isOn = false
        
        switch typeOfAccessory {
        case .switchButton:
            cell?.accessoryView = switchButton
        case .disclosureIndicator:
            cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        case .none:
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }

        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailView()
        tableView.deselectRow(at: indexPath, animated: true)
        viewController.setting = settings?[indexPath.section][indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

