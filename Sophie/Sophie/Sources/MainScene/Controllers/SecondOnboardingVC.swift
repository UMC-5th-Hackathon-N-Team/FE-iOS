//
//  SecondOnboardingVC.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

class SecondOnboardingVC: UIViewController {
    
    private let mainView = MainView()
    private let secondView = SecondView()

    override func loadView() {
        view = mainView
        view = secondView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        secondView.confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    @objc func confirmButtonTapped() {
        Vibration.medium.vibrate()
        let tabBarVC = CustomTabBarController()
        tabBarVC.modalTransitionStyle = .coverVertical
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
    
    

}

private extension SecondOnboardingVC {
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.mainIconImageView)
    }
    
}
