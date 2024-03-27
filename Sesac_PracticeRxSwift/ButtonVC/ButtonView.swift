//
//  ButtonView.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import Then

final class ButtonView: BaseView {
    
    let button = UIButton().then {
        $0.setTitle("버튼", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
    }
    
    let label = UILabel().then {
        $0.text = "텍스트"
    }
    
    let textField = UITextField().then {
        $0.placeholder = "플레이스 홀더"
    }
    
    override func configureHierarchy() {
        [
            button,
            label,
            textField
        ].forEach { addSubview($0) }
    }
    
    override func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    override func configureView() {
        
    }
}
