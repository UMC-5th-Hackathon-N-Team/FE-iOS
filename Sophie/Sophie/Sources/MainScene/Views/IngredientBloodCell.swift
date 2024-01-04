//
//  IngredientBloodCell.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

import SnapKit
import Then

class IngredientBloodCell: UITableViewCell {
    
    static let identifier = "IngredientBloodCell"
    
    let wholeBloodView = UIView().then {
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.systemRed.cgColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = UILabel().then {
        $0.text = "⭐️ 성분 헌혈 성취도"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    let progressBar = UIProgressView(progressViewStyle: .default)
    
    let percentageLabel = UILabel().then {
        $0.text = "50%"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .left
    }
    
    lazy var progressStackView = UIStackView(arrangedSubviews: [titleLabel, progressBar]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 10
        $0.distribution = .fill
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
        configure(percentage: nil)
    }
    
    private func setupUI() {
        contentView.addSubview(progressStackView)
        
        progressStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.leading.equalTo(20)
        }
        
        progressBar.setProgress(0.7, animated: true)
        progressBar.trackTintColor = #colorLiteral(red: 0.850513339, green: 0.850513339, blue: 0.850513339, alpha: 1)
        progressBar.progressTintColor = .systemRed
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = progressBar.frame.height / 2
    }
    
    func configure(percentage: String?) {
        percentageLabel.text = percentage
    }
    
}
