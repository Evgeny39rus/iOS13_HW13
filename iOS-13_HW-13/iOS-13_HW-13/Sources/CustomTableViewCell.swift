import UIKit
import SnapKit

class customTableViewCell: UITableViewCell {
    var setting: Setting? {
        didSet {
            image.image = setting?.image
            name.text = setting?.name
            status.text = setting?.statusText
        }
    }
    
    // MARK: UI
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var name: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 15)
        name.textColor = .black
        return name
    }()
    
    private lazy var status: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 15)
        status.textColor = .systemGray
        return status
    }()
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup
    private func setupHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(status)
        contentView.addSubview(name)
    }

    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(16)
            make.width.height.equalTo(60)
        }
        name.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.left.equalTo(image.snp.right)
        }
        
        status.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.right.equalTo(contentView).offset(-20)
        }
        
           
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryView = .none
        self.setting = nil
    }
    
}
