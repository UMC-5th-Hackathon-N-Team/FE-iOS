//
//  HeaderCell.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

import SnapKit
import Then

class HeaderCell: UITableViewCell {
    
    static let identifier = "HeaderCell"
    
    let headerView = UIView().then {
        $0.backgroundColor = .systemRed
    }
    
    let headerLabel = UILabel().then {
        $0.text = "라파님! 올해 무려 \n15번이나 헌혈을 하셨어요!😲"
        $0.numberOfLines = 0
        $0.textAlignment = .center
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
    }
    
    private func setupUI() {
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        headerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints {
            $0.centerX.centerY.equalTo(contentView)
            $0.top.leading.equalTo(30)
        }
    }
    
    func configure(donationCount: String?) {
        headerLabel.text = donationCount
        
        let attributedString = NSMutableAttributedString(string: headerLabel.text!, attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .bold), .foregroundColor: UIColor.white])
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40, weight: .bold), range: (headerLabel.text! as NSString).range(of: "37"))
        
        headerLabel.attributedText = attributedString
    }
    
}
