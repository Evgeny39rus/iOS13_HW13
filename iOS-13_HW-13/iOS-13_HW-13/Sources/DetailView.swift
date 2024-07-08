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

    private func setupHierarchy() {
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(name)
    }

    private func setupLayout() {
        image.snp.makeConstraints {
            $0.centerY.centerX.equalTo(view)
        }
        name.snp.makeConstraints {
            $0.centerX.equalTo(image)
            $0.top.equalTo(image.snp.bottom)
        }
    }

    private func fillSettings() {
     //   image.image = setting?.image
        name.text = setting?.name
    }
    }

