import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var settings: [[Setting]]?
    
    // MARK: UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        setupNavigatoinBar()
        tableView.reloadData()
    }
    
    private func setupNavigatoinBar(){
        title = "Setting"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        settings = Setting.newSetting
        view.addSubview(tableView)
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

