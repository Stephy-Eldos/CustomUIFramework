//
//  RootViewController.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 30/4/22.
//

import UIKit
import CustomUIFramework

class RootViewController: UIViewController {

    @IBOutlet var navigationBar: NavigationBar! = nil
    @IBOutlet var navigationTab: NavigationTab! = nil
    @IBOutlet var containerView: UIView! = nil
    @IBOutlet weak var constraintNavigationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintNavigationTabHeight: NSLayoutConstraint!
    
    var containerNavigationController = UINavigationController()
    var navigationRouter: NavigationRouter?
    var isNavigationBarHidden: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.constraintNavigationViewHeight.constant = self?.isNavigationBarHidden ?? false ? 0 : 50
            }
            
        }
    }
    
    var isNavigationTabHidden: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.constraintNavigationTabHeight.constant = self?.isNavigationTabHidden ?? false ? 0 : 60
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        print("Root VC called")
    }
    
    func setUp() {
        setUpRootAndRoute()
        setUpHorizontalNavigationBar()
    }
    
    func setUpRootAndRoute() {
 //       navigationBar.rootViewController = self
        navigationRouter = NavigationRouter(rootViewController: self)
        
//        if UserDefaults.standard.value(forKey: "userLoginDetails") != nil {
//            let tuUser = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: "userLoginDetails") as! Data) as? NSDictionary
  //          LoginDetails.currentUser.initWithDict(dict: tuUser!)
            
       navigationRouter?.loadViewControllerFromStoryboard(type: MainViewController.self)
  //      } else {
  //          navigationRouter?.loadViewControllerFromStoryboard(type: LoginViewController.self)
 //      }
    }
    
    func setUpHorizontalNavigationBar() {
        let navItemWidth = UIScreen.main.bounds.width/3
        let items = [
            NavigationTabItem(title: "HOME", image: UIImage(named: "icon-home"), action: {
 //           self.navigationRouter?.loadViewControllerFromStoryboard(type: HomeViewController.self)

        }, width: navItemWidth),
        NavigationTabItem(title: "ACCOUNTS", image: UIImage(named: "icon-installation"), action: {
 


        }, width: navItemWidth),
        NavigationTabItem(title: "PROFILE", image: UIImage(named: "icon-point"), action: {

            }, width: navItemWidth)]
        navigationTab.items = items


    }
}
