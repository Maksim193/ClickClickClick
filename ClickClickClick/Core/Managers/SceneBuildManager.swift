//
//  SceneBuildManager.swift
//  ClickClickClick
//
//  Created by Swift Learning on 03.12.2022.
//

protocol Buildable {
    func buildStartScreen() -> StartViewController
    func buildMainScreen() -> MainViewController
}

final class SceneBuildManager {
    private let defaultsManager: DefaultsManagerable
    
    init() {
        defaultsManager = DefaultsManager()
    }
}

extension SceneBuildManager: Buildable {
    func buildStartScreen() -> StartViewController {
        let viewController = StartViewController()
        let presenter = StartPresenter(sceneBuildManager: self)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    func buildMainScreen() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(
            sceneBuildManager: self,
            defaultsStorage: defaultsManager
        )
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}
