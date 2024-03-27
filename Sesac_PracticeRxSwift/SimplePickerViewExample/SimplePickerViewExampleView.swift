//
//  SimplePickerViewExampleView.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import Then

final class SimplePickerViewExampleView: BaseView {
    
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    let pickerView3 = UIPickerView()
    
    override func configureHierarchy() {
        [
            pickerView1,
            pickerView2,
            pickerView3
        ].forEach { addSubview($0) }
    }
    
    override func configureLayout() {
        pickerView1.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        pickerView2.snp.makeConstraints { make in
            make.top.equalTo(pickerView1.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        pickerView3.snp.makeConstraints { make in
            make.top.equalTo(pickerView2.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    override func configureView() {
        
    }
}
