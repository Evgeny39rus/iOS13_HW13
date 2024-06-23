//
//  CustomTableViewCell.swift
//  iOS-13_HW-13
//
//  Created by Евгений Сушков on 22.06.2024.
//

import UIKit
import SnapKit

class settingsTableViewCell: UITableViewCell {
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

        name.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(image.snp.right).offset(16)
        }
    }

    
    
    
    
}
