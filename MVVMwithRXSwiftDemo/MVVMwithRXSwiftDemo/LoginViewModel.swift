//
//  LoginViewModel.swift
//  MVVMwithRXSwiftDemo
//
//  Created by Keith Gapusan on 16/07/2018.
//  Copyright © 2018 Keith Gapusan. All rights reserved.
//

import Foundation

import RxSwift


struct LoginViewModel{
    var emailTextField = Variable<String>("")
    var passwordTextField = Variable<String>("")
    
    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailTextField.asObservable(), passwordTextField.asObservable()){
            email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
