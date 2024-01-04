//
//  DayCounterCell.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

import SnapKit
import Then

class DayCounterCell: UITableViewCell {
    
    static let identifier = "DayCounterCell"
    
    let dayCounterView = UIView().then {
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.systemRed.cgColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    let dayCounterLabel = UILabel().then {
        $0.text = "다음 헌혈까지 \nD-8 남았습니다!"
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
        configure(dayLeft: nil)
    }
    
    private func setupUI() {
        contentView.addSubview(dayCounterView)
        dayCounterView.addSubview(dayCounterLabel)
        
        dayCounterView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.leading.equalTo(15)
        }
        
        dayCounterLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.top.leading.equalTo(30)
        }
    }
    
    func configure(dayLeft: String?) {
        dayCounterLabel.text = dayLeft
        
        let attributedString = NSMutableAttributedString(string: dayCounterLabel.text!, attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .bold), .foregroundColor: UIColor.black])
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemRed, range: (dayCounterLabel.text! as NSString).range(of: "D-8"))
        
        dayCounterLabel.attributedText = attributedString
    }
    
}
