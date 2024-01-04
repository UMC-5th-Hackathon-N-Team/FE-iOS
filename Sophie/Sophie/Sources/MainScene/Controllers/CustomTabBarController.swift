//
//  CustomTabBarController.swift
//  Sophie
//
//  Created by Rafael on 1/5/24.
//

import UIKit

import SnapKit
import Then

final class CustomTabBarController: UIViewController {
    
    // MARK: - Enums and Properties
    
    fileprivate enum Tab {
        case home, book, myPage
        
        var viewController: UIViewController {
            switch self {
            case .home:
                return UINavigationController(rootViewController: MainViewController())
            case .book:
                return UINavigationController(rootViewController: StickerBookViewController())
            case .myPage:
                return UINavigationController(rootViewController: MyPageViewController())
            }
        }
        
        var imageName: String {
            switch self {
            case .home: return "house"
            case .book: return "book"
            case .myPage: return "person"
            }
        }
    }
    
    private lazy var tabs: [Tab] = [.home, .book, .myPage]
    private lazy var customTabBarView = UIView()
    private var currentViewController: UIViewController?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        switchToViewController(tabs[0].viewController)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBarView.layer.shadowPath = UIBezierPath(
            roundedRect: customTabBarView.bounds,
            cornerRadius: 30
        ).cgPath
    }
    
}

// MARK: - UI Setup

private extension CustomTabBarController {
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(customTabBarView)
        setupCustomTabBarView()
        configureTabBarButtons()
    }
    
    func setupCustomTabBarView() {
        configureTabBarAppearance()
        setTabBarConstraints()
    }
    
    func configureTabBarAppearance() {
        customTabBarView.backgroundColor = .white
        
        customTabBarView.configureCornerRadius(true, cornerRadius: 30)
        customTabBarView.configureShadow(
            false, shadowColor: .systemGray,
            shadowOffset: CGSize(width: 0, height: 1),
            shadowOpacity: 1,
            shadowRadius: 2
        )
    }
    
    func setTabBarConstraints() {
        customTabBarView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
    }
    
}

// MARK: - Tab Bar Button Configuration Extensions

private extension CustomTabBarController {
    
    func configureTabBarButtons() {
        let stackView = createTabBarButtons()
        
        tabs.forEach { tab in
            let button = createTabBarButton(for: tab)
            stackView.addArrangedSubview(button)
        }
        
        customTabBarView.addSubview(stackView)
        setTabBarButtonsConstraints(stackView)
    }
    
    func createTabBarButton(for tab: Tab) -> UIButton {
        let button = UIButton(type: .custom).then {
            $0.setImage(UIImage(systemName: tab.imageName)?
                .withTintColor(.black, renderingMode: .alwaysOriginal)
                .withConfiguration(
                    UIImage.SymbolConfiguration(
                        pointSize: 20.0, weight: .regular
                    )
                ), for: .normal
            )
            $0.addTarget(self, action: #selector(tabBarButtonTapped), for: .touchUpInside)
            $0.tag = tabs.firstIndex(of: tab) ?? 0
        }
        return button
    }
    
    func createTabBarButtons() -> UIStackView {
        let stackView = UIStackView().then {
            $0.configureStackView(
                alignment: .fill,
                axis: .horizontal,
                distribution: .fillEqually,
                spacing: nil
            )
        }
        return stackView
    }
    
    func setTabBarButtonsConstraints(_ stackView: UIStackView) {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

// MARK: - Tab Bar Button Action Handler

private extension CustomTabBarController {
    
    func switchToViewController(_ vc: UIViewController) {
        removeCurrentViewController()
        addNewViewController(vc)
    }
    
    func removeCurrentViewController() {
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
    }
    
    func addNewViewController(_ vc: UIViewController) {
        addChild(vc)
        vc.view.frame = view.bounds
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        view.bringSubviewToFront(customTabBarView)
        currentViewController = vc
    }
    
    @objc func tabBarButtonTapped(_ sender: UIButton) {
        Vibration.medium.vibrate()
        let selectedTab = tabs[sender.tag]
        switchToViewController(selectedTab.viewController)
    }
    
}
