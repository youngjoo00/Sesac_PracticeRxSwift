//
//  SimpleValidationViewController.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SimpleValidationViewController: BaseViewController {

    let mainView = SimpleValidationView()
    
    private let minimalUsernameLength = 5
    private let minimalPasswordLength = 5
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.usernameValidLabel.text = "Username has to be at least \(minimalUsernameLength) characters"
        mainView.passwordValidLabel.text = "Password has to be at least \(minimalPasswordLength) characters"
        
        let usernameValid = mainView.usernameTextField.rx.text.orEmpty
            .map { $0.count >= self.minimalUsernameLength }
            .share(replay: 1)

        let passwordValid = mainView.passwordTextField.rx.text.orEmpty
            .map { $0.count >= self.minimalPasswordLength }
            .share(replay: 1)

        let everythindValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)
        
        usernameValid
            .bind(to: mainView.usernameValidLabel.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind(to: mainView.usernameValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: mainView.passwordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)

        everythindValid
            .bind(to: mainView.doSomethingButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        mainView.doSomethingButton.rx.tap
            .subscribe(with: self) { owner, _ in
                self.showAlert(title: "로그인 성공!", message: "야호", btnTitle: "확인") {}
            }
            .disposed(by: disposeBag)

    }

}
