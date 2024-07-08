import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name
            statusLabel.text = setting?.statusText

            // Изменяем фон logoContainer в зависимости от setting
            logoContainer.backgroundColor = setting?.backgroundColor ?? .clear

            if let logoName = setting?.logoImageName {
                logoImageView.image = UIImage(systemName: logoName)
            } else {
                logoImageView.image = nil
            }
        }
    }
    
    // UI components
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var logoContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5 // Устанавливаем радиус скругления
        view.clipsToBounds = true
        view.backgroundColor = .clear // Фон контейнера может быть задан через Setting
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white // Задаём цвет иконки, можно менять в didSet
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(logoContainer)
        logoContainer.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
    }

    private func setupLayout() {
        logoContainer.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(32)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.edges.equalTo(logoContainer).inset(3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(logoImageView.snp.right).offset(19)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
        }
    }
    
}

extension UIColor {
    static let customBlue = UIColor(red: 0.05, green: 0.5, blue: 0.99, alpha: 1.0)
}
