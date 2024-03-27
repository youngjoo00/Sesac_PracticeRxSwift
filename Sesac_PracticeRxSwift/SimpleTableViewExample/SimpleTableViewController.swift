//
//  SimpleTableViewExampleViewController.swift
//  Sesac_PracticeRxSwift
//
//  Created by youngjoo on 3/27/24.
//

import UIKit
import RxSwift
import RxCocoa

final class SimpleTableViewController: BaseViewController {
    
    private let mainView = SimpleTableView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        let items = Observable.just(
            (100..<120).map { "\($0)"}
        )
        
        // cellForRowAt 역할을 담당하는 듯 하다
        items.bind(to: mainView.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { row, element, cell in
            cell.textLabel?.text = "element: \(element), row: \(row)"
            cell.accessoryType = .detailDisclosureButton
        }
        .disposed(by: disposeBag)
        
        mainView.tableView.rx
            .modelSelected(String.self)
            .subscribe(with: self) { owner, value in
                self.showAlert(title: "Tapped!", message: "\(value)", btnTitle: "ok") {}
            }
            .disposed(by: disposeBag)
        
        mainView.tableView.rx
            .itemAccessoryButtonTapped
            .subscribe(onNext: { indexPath in
                print(indexPath, indexPath.row)
            })
            .disposed(by: disposeBag)
    }
}
