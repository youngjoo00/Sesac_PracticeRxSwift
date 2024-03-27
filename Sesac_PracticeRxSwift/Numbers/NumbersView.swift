//
//  NumbersView.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import Then

final class NumbersView: BaseView {
    
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let separator = UIView().then {
        $0.backgroundColor = .black
    }
    let plusLabel = UILabel().then {
        $0.text = "+"
    }
    let resultLabel = UILabel()
    
    override func configureHierarchy() {
        [
            textField1,
            textField2,
            textField3,
            separator,
            plusLabel,
            resultLabel,
        ].forEach { addSubview($0) }
    }
    
    override func configureLayout() {
        textField1.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        textField3.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(textField3.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(1)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.top.equalTo(textField3)
            make.centerX.equalToSuperview()
            make.trailing.equalTo(textField3.snp.leading).offset(-10)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
    override func configureView() {
        
    }
}
