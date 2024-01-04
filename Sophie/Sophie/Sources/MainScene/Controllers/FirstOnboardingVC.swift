//
//  FirstOnboardingVC.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

class FirstOnboardingVC: UIViewController {
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.text = "소피를 선택해 주셔서 고맙습니다."
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.text = "작은 나눔, 큰 기적 \n당신의 헌혈이 새로운 생명을 살립니다."
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemRed
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setAttributedTitle(
            NSAttributedString(
                string: "다음",
                attributes: [
                    .font: UIFont.systemFont(
                        ofSize: 20.0,
                        weight: .bold
                    ),
                    .foregroundColor: UIColor.white
                ]
            ),
            for: .normal
        )
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainTitle)
        view.addSubview(subTitle)
        view.addSubview(nextButton)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: mainTitle.leadingAnchor, constant: 10),
            
            nextButton.centerXAnchor.constraint(equalTo: subTitle.centerXAnchor),
            nextButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -5
            ),
            nextButton.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func nextButtonTapped() {
        Vibration.medium.vibrate()
        let nextVC = SecondOnboardingVC()
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
}
