//
//  BottomButtonCell.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

import SnapKit
import Then

class BottomButtonCell: UITableViewCell {
    
    static let identifier = "BottomButtonCell"
    
    let certificationButton = UIButton(configuration: .plain(), primaryAction: UIAction(handler: { _ in
        print("Certification")
    })).then {
        let image = UIImage(systemName: "doc")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.setAttributedTitle(NSAttributedString(string: "헌혈 증서 인증하기", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.black]), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray.cgColor
        
        var config = $0.configuration
        config?.imagePadding = 10
        
        $0.configuration = config
    }
    
    let giftOpenButton = UIButton(configuration: .plain(), primaryAction: UIAction(handler: { _ in
        print("Gift open")
    })).then {
        let image = UIImage(systemName: "gift.fill")?.withRenderingMode(.alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.setAttributedTitle(NSAttributedString(string: "선물 열기", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.black]), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemRed.cgColor
        
        var config = $0.configuration
        config?.imagePadding = 10
        
        $0.configuration = config
    }
    
    let guidelineButton = UIButton(configuration: .plain(), primaryAction: UIAction(handler: { _ in
        print("Guide")
    })).then {
        let image = UIImage(systemName: "doc")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.setAttributedTitle(NSAttributedString(string: "헌혈 가이드라인", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold), .foregroundColor: UIColor.black]), for: .normal)
        $0.semanticContentAttribute = .forceLeftToRight
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray.cgColor
        
        var config = $0.configuration
        config?.imagePadding = 10
        
        $0.configuration = config
    }
    
    lazy var buttons = UIStackView(arrangedSubviews: [certificationButton, giftOpenButton, guidelineButton]).then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(buttons)
        
        giftOpenButton.snp.makeConstraints {
            $0.height.equalTo(55)
        }
        
        buttons.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
}
