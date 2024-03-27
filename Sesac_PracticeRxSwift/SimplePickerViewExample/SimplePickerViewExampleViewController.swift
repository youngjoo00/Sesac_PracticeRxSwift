//
//  SimplePickerViewExampleViewController.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SimplePickerViewExampleViewController: BaseViewController {
    
    private let mainView = SimplePickerViewExampleView()

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        Observable.just([11, 22, 33])
            .bind(to: mainView.pickerView1.rx.itemTitles) { index, element in
                return "index: \(index), element: \(element)"
            }
            .disposed(by: disposeBag)
        
        Observable.just([100, 200, 300])
            .bind(to: mainView.pickerView2.rx.itemAttributedTitles) { _, item in
                return NSAttributedString(string: "\(item)",
                                          attributes: [
                                            NSAttributedString.Key.foregroundColor: UIColor.green,
                                            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                                          ])
            }
            .disposed(by: disposeBag)
        
        mainView.pickerView2.rx.modelSelected(Int.self)
            .subscribe { models in
                print("selected: \(models)")
            }
            .disposed(by: disposeBag)
        
        Observable.just([UIColor.red, UIColor.blue, UIColor.green])
            .bind(to: mainView.pickerView3.rx.items) { index, item, c in
                print(index, item, c)
                let view = UIView()
                view.backgroundColor = item
                return view
            }
            .disposed(by: disposeBag)

        mainView.pickerView3.rx.modelSelected(UIColor.self)
            .subscribe { models in
                print("selected: \(models)")
            }
            .disposed(by: disposeBag)
    }
}
