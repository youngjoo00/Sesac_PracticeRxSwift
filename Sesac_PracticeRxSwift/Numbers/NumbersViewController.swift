//
//  NumbersViewController.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

final class NumbersViewController: BaseViewController {
    
    private let mainView = NumbersView()

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        // The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
//        Observable.combineLatest(mainView.textField1.rx.text.orEmpty,
//                                 mainView.textField2.rx.text.orEmpty,
//                                 mainView.textField3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
//                return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
//            }
//            .map { $0.description }
//            .bind(to: result.rx.text)
//            .disposed(by: disposeBag)
        
        // 주어진 여러 Observable 시퀀스를 하나의 Observable 시퀀스로 병합
        // 병합된 시퀀스에 존재하는 값 중 하나라도 변경을 감지한다면 감지한 내용을 모두에게 한번에 반영할 수 있음
        let combinedObservable = Observable.combineLatest(
            mainView.textField1.rx.text.orEmpty,
            mainView.textField2.rx.text.orEmpty,
            mainView.textField3.rx.text.orEmpty
        )
        
        // 변경 감지해서 더하고 Int 로 반환
        let sumObservable = combinedObservable.map { textValue1, textValue2, textValue3 in
            print(textValue1, textValue2, textValue3)
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
        
        let descriptionObservable = sumObservable.map { $0.description }

        // observable 구독, 변경된 값을 옵저버인 resultLabel.rx.text 에게 전달
        descriptionObservable
            .bind(to: mainView.resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
