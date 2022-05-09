//
//  ViewController.swift
//  TestApp
//
//  Created by Eldos Thomas on 29/4/22.
//

import UIKit
import CustomUIFramework

class MainViewController: BaseViewController {
    
    @IBOutlet weak var inputFieldUserID: InputField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        isNavigationTabHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardObserver()
    }
    
    @IBAction func onSignOut(_ sender: Any) {
        PopAlertViewTwoActions.popWithTwoActions(message: "Confirm Sign Out?", affirmTitle: "Ok", affirmTitle2: "Cancel",
            actionFirstButton: {
            self.inputFieldUserID.isHidden = true
        },
            actionSecondButton: {
            Void()
        })
    }
    
}

extension MainViewController: NibableViewController {
    static func instantateFromNib() -> BaseViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        return viewController
    }
}
