//
//  WholeBloodCell.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

import SnapKit
import Then

class WholeBloodCell: UITableViewCell {
    
    static let identifier = "WholeBloodCell"
    
    let titleLabel = UILabel().then {
        $0.text = "🩸 전혈 성취도"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    let bloodIconImageView = UIImageView().then {
        $0.image = UIImage(named: "bloodFill")
        $0.contentMode = .scaleAspectFit
    }
    
    lazy var bloodIconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(image: nil)
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(bloodIconStackView)
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.leading.equalTo(20)
        }
        
        bloodIconStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        (1...5).forEach { index in
            let imageName = index <= 4 ? "bloodFill" : "blood"
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.contentMode = .scaleAspectFit
            bloodIconStackView.addArrangedSubview(imageView)
        }
    }
    
    func configure(image: UIImage?) {
        bloodIconImageView.image = UIImage(named: "bloodFill")
    }
    
}
