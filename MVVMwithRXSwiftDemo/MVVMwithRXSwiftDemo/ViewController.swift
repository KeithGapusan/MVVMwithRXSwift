//
//  ViewController.swift
//  MVVMwithRXSwiftDemo
//
//  Created by Keith Gapusan on 16/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var labelStatus: UILabel!
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //bind textfield to the view model
        emailTextField.rx.text.map{ $0 ?? ""}.bind(to: loginViewModel.emailTextField)
        passTextField.rx.text.map{ $0 ?? ""}.bind(to: loginViewModel.passwordTextField)
        
        loginViewModel.isValid.bind(to: btnLogin.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.labelStatus.text = isValid ? "Enabled" : "Not Enabled"
            
        }).disposed(by: disposeBag)
    }

 
}

