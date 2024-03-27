//
//  SimpleValidationView.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import Then

final class SimpleValidationView: BaseView {
    
    let usernameTextField = UITextField().then {
        $0.borderStyle = .line
    }
    let usernameValidLabel = UILabel()
    let passwordTextField = UITextField().then {
        $0.borderStyle = .bezel
    }
    let passwordValidLabel = UILabel()
    let doSomethingButton = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
    }
    
    override func configureHierarchy() {
        [
            usernameTextField,
            usernameValidLabel,
            passwordTextField,
            passwordValidLabel,
            doSomethingButton
        ].forEach { addSubview($0) }
    }
    
    override func configureLayout() {
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        usernameValidLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameValidLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        passwordValidLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        doSomethingButton.snp.makeConstraints { make in
            make.top.equalTo(passwordValidLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    override func configureView() {
        
    }
}
