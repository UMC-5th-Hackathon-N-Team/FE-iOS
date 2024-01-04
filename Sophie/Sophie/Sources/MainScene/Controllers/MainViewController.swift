//
//  MainViewController.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    private var mainModel = [MainModel]()
    private let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(DayCounterCell.self, forCellReuseIdentifier: DayCounterCell.identifier)
        tableView.register(ProgressCell.self, forCellReuseIdentifier: ProgressCell.identifier)
        tableView.register(IngredientBloodCell.self, forCellReuseIdentifier: IngredientBloodCell.identifier)
        tableView.register(WholeBloodCell.self, forCellReuseIdentifier: WholeBloodCell.identifier)
        tableView.register(BottomButtonCell.self, forCellReuseIdentifier: BottomButtonCell.identifier)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height ?? 49
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight + 20, right: 0)
        
        refresh()
    }
    
    private func refresh() {
        mainModel = [
            .bloodDonationCounter(donationCount: "라파님! 올해 무려 \n15번이나 헌혈을 하셨어요!😲"),
            .dayCounter(dayLeft: "다음 헌혈까지 \nD-8 남았습니다!"),
            .percentage(percentage: "50%"),
            .IngredientBlood(percentage: "70%"),
            .wholeBlood(image: UIImage(named: "bloodFill")!),
            .giftButton(gift: UIButton(type: .custom))
        ]
        tableView.reloadData()
    }
    
    @objc func titleButtonTapped() {
        let progressionVC = ProgressionViewController()
        
        navigationController?.pushViewController(progressionVC, animated: true)
    }
    
    @objc func certificationButtonTapped() {
        let certificationVC = CertificationViewController()
        navigationController?.pushViewController(certificationVC, animated: true)
    }
    
    @objc func guidelineButtonTapped() {
        let guidelineVC = GuidelineViewController()
        guidelineVC.modalTransitionStyle = .coverVertical
        guidelineVC.modalPresentationStyle = .formSheet
        present(guidelineVC, animated: true)
    }
    
    @objc func giftOpenButtonTapped() {
        let giftVC = GiftViewController()
        navigationController?.pushViewController(giftVC, animated: true)
    }

}

private extension MainViewController {
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: mainView.mainIconImageView)
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch mainModel[indexPath.row] {
        case .bloodDonationCounter(donationCount: let donationCount):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else { return UITableViewCell() }
            cell.configure(donationCount: donationCount)
            cell.selectionStyle = .none
            return cell
        case .dayCounter(dayLeft: let dayLeft):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DayCounterCell.identifier, for: indexPath) as? DayCounterCell else { return UITableViewCell() }
            cell.configure(dayLeft: dayLeft)
            cell.selectionStyle = .none
            return cell
        case .percentage(percentage: let percentage):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgressCell.identifier, for: indexPath) as? ProgressCell else { return UITableViewCell() }
            cell.configure(percentage: percentage)
            cell.titleButton.addTarget(self, action: #selector(titleButtonTapped), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        case .IngredientBlood(percentage: let percentage):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientBloodCell.identifier, for: indexPath) as? IngredientBloodCell else { return UITableViewCell() }
            cell.configure(percentage: percentage)
            cell.selectionStyle = .none
            return cell
        case .wholeBlood(image: let image):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WholeBloodCell.identifier, for: indexPath) as? WholeBloodCell else { return UITableViewCell() }
            cell.configure(image: image)
            cell.selectionStyle = .none
            return cell
        case .giftButton:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BottomButtonCell.identifier, for: indexPath) as? BottomButtonCell else { return UITableViewCell() }
            cell.certificationButton.addTarget(self, action: #selector(certificationButtonTapped), for: .touchUpInside)
            cell.giftOpenButton.addTarget(self, action: #selector(giftOpenButtonTapped), for: .touchUpInside)
            cell.guidelineButton.addTarget(self, action: #selector(guidelineButtonTapped), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension MainViewController: UITableViewDelegate {
}
