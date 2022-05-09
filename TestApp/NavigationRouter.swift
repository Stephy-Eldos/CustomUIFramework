//
//  NavigationRouter.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import Foundation
import UIKit

protocol NibableViewController: Nibable,BaseViewController {
}

class NavigationRouter {
    
    var rootViewController: RootViewController
    
    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
    }
    
    func loadViewControllerFromStoryboard<T: NibableViewController>(type: T.Type) {
        loadViewController(view: NavigationRouter.createViewFromStoryBoard(type: type))
    }
    
    
    func pushViewControllerFromStoryBoard<T: NibableViewController>(type: T.Type, willPush: ((T) -> Void)? = nil) {
        let view = NavigationRouter.createViewFromStoryBoard(type: type)
        willPush?(view)
        pushViewController(view: view)
    }
    
    func loadViewControllerForUrlsFromStoryBoard<T: NibableViewController>(type: T.Type, willPush: ((T) -> Void)? = nil) {
        let view = NavigationRouter.createViewFromStoryBoard(type: type)
        willPush?(view)
        loadViewController(view: view)
    }
    
    private func loadViewController(view: BaseViewController) {
        
        rootViewController.navigationController?.view.removeFromSuperview()
        view.rootViewController = rootViewController
        rootViewController.containerNavigationController = UINavigationController(rootViewController: view)
        rootViewController.containerView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        rootViewController.containerView.addSubview(self.rootViewController.containerNavigationController.view)
        rootViewController.containerNavigationController.view.frame = self.rootViewController.containerView.bounds
        rootViewController.containerNavigationController.isNavigationBarHidden = true
        rootViewController.navigationBar?.buttonBack.isHidden = true
    }
    
    func pushViewController(view: BaseViewController) {
        view.rootViewController = rootViewController
        rootViewController.containerNavigationController.pushViewController(view, animated: true)
        rootViewController.navigationBar?.buttonBack.isHidden = false
    }
    
    static func createViewFromStoryBoard<T: Nibable>(type: T.Type) -> T{
        return type.instantateFromNib() as! T
    }
    
    func dismiss() {
        rootViewController.navigationBar?.buttonBack.isHidden = rootViewController.containerNavigationController.viewControllers.count <= 2
        rootViewController.containerNavigationController.popViewController(animated: true)
    }
    
}
