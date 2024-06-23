import UIKit
import SnapKit

final class DetailView: UIViewController {
        var setting: Setting?

        // MARK: UI
        private lazy var image: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            return image
        }()

        private lazy var name: UILabel = {
            let name = UILabel()
            name.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            name.textColor = .black
            return name
        }()

        // MARK: Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupHierarchy()
            setupLayout()
            fillSettings()
        }

        // MARK: Setup
        private func setupHierarchy() {
            view.backgroundColor = .white
            view.addSubview(image)
        }

        private func setupLayout() {
            // Layout code would go here
        }

        private func fillSettings() {
            if let setting = setting {
                image.image = setting.image
                name.text = setting.name
            }
        }
    }

