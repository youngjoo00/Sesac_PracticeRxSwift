//
//  ButtonViewController.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

final class ButtonViewController: BaseViewController {
    
    private let mainView = ButtonView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.button.rx.tap.bind(with: self) { owner, _ in
            self.mainView.label.text = "ㅎㅇ"
            self.mainView.textField.text = "gdgd"
        }.disposed(by: disposeBag)
        
        mainView.button.rx.tap
            .map { "gd" }
            .bind(to: mainView.label.rx.text, mainView.textField.rx.text)
            .disposed(by: disposeBag)
        
    }
}
