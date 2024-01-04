//
//  ProgressCell.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

import SnapKit
import Then

class ProgressCell: UITableViewCell {
    
    static let identifier = "ProgressCell"
    
    let titleButton = UIButton(configuration: .plain(), primaryAction: UIAction(handler: { _ in
        print("헌혈 유공패 진행률")
    })).then {
        let image = UIImage(systemName: "chevron.right")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        $0.setImage(image, for: .normal)
        $0.setAttributedTitle(NSAttributedString(string: "🏆 헌혈 유공패 진행률", attributes: [.font: UIFont.systemFont(ofSize: 30, weight: .bold), .foregroundColor: UIColor.black]), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        
        var config = $0.configuration
        config?.imagePadding = 10
        
        $0.configuration = config
    }
    
    let progressBar = UIProgressView(progressViewStyle: .default)
    
    let percentageLabel = UILabel().then {
        $0.text = "50%"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textAlignment = .left
    }
    
    lazy var progressStackView = UIStackView(arrangedSubviews: [titleButton, progressBar]).then {
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
            $0.top.equalTo(10)
            $0.leading.equalTo(20)
        }
        
        progressBar.setProgress(0.5, animated: true)
        progressBar.trackTintColor = #colorLiteral(red: 0.850513339, green: 0.850513339, blue: 0.850513339, alpha: 1)
        progressBar.progressTintColor = .systemRed
        progressBar.clipsToBounds = true
        progressBar.layer.cornerRadius = progressBar.frame.height / 2
    }
    
    func configure(percentage: String?) {
        percentageLabel.text = percentage
    }
    
}
