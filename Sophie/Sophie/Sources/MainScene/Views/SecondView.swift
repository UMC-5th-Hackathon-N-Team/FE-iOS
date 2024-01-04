//
//  SecondView.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

import SnapKit
import Then

class SecondView: UIView {

    let nameTitle = UILabel().then {
        $0.text = "이름을 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let firstTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    lazy var firstStackView = UIStackView(arrangedSubviews: [nameTitle, firstTextField]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    let genderTitle = UILabel().then {
        $0.text = "성별을 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let secondTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    lazy var secondStackView = UIStackView(arrangedSubviews: [genderTitle, secondTextField]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    let birthTitle = UILabel().then {
        $0.text = "생년월일을 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let thirdTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    lazy var thirdStackView = UIStackView(arrangedSubviews: [birthTitle, thirdTextField]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    let bloodTitle = UILabel().then {
        $0.text = "혈액형을 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let fourthTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    lazy var fourthStackView = UIStackView(arrangedSubviews: [bloodTitle, fourthTextField]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    let accumulateBloodTitle = UILabel().then {
        $0.text = "누적 헌혈 횟수를 입력해주세요."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    let fifthTextField = UITextField().then {
        $0.borderStyle = .roundedRect
    }
    
    let confirmButton = UIButton().then {
        $0.titleLabel?.textColor = .white
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        $0.setTitle("소피하기", for: .normal)
        $0.backgroundColor = .systemRed
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    lazy var fifthStackView = UIStackView(arrangedSubviews: [accumulateBloodTitle, fifthTextField]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 5
        $0.distribution = .fillEqually
    }
    
    lazy var infoStackView = UIStackView(arrangedSubviews: [firstStackView, secondStackView, thirdStackView, fourthStackView, fifthStackView]).then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .fill
        $0.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(infoStackView)
        addSubview(confirmButton)
        
        firstTextField.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        infoStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.equalTo(20)
        }
        
        confirmButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(infoStackView.snp.bottom).offset(50)
            $0.leading.equalTo(20)
            $0.height.equalTo(50)
        }
    }
    
}
