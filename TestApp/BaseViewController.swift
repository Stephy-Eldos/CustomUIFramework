//
//  BaseViewController.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import UIKit
import CustomUIFramework

class BaseViewController: UIViewController {
    
        weak var rootViewController: RootViewController? = nil
        weak var navigationRouter: NavigationRouter? {
            get {
                rootViewController?.navigationRouter
            }
        }
        
        var navigationItems: [NavigationViewItem]? {
            didSet {
                rootViewController?.navigationBar.items = navigationItems
            }
        }
        
        var isNavigationBarHidden = false
        var isNavigationTabHidden = false
        
        
        override func viewDidLoad() {
            isNavigationBarHidden = false
            isNavigationTabHidden = false
            navigationItems = navigationBellAndLogout
            print("Base VC called")
        }
        
        override func viewWillAppear(_ animated: Bool) {
            rootViewController?.navigationBar.items = navigationItems
            rootViewController?.navigationBar?.title = title
            rootViewController?.isNavigationBarHidden = isNavigationBarHidden
            rootViewController?.isNavigationTabHidden = isNavigationTabHidden
        }
        
        deinit {
            print("deinit")
        }
    }

    extension BaseViewController {
        var navigationBellAndLogout: [NavigationViewItem] {
            get {
                let items = [NavigationViewItem(image: UIImage(named: Assets.Keys.Bell), action: { [weak self] in
   //                 self?.navigationRouter?.loadViewControllerFromStoryboard(type: NotificationViewController.self)
                }),
                NavigationViewItem(image: UIImage(named: Assets.Keys.Logout), action: { [weak self] in
                    let alert = UIAlertController(title: "CONFIRM SIGN OUT?", message: "Are you sure you want to SIGN out of this App?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "CANCEL", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "SIGN OUT", style: .default, handler: { action in
//                        self?.rootViewController?.navigationRouter?.loadViewControllerFromStoryboard(type: LoginViewController.self)
//                        UserDefaults.standard.removeObject(forKey: "userLoginDetails")
                    }))
                    self?.present(alert, animated: true, completion: nil)
                })]
                return items
            }
        }
    }

