//
//  SettingsPopoverVC.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 13/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class SettingsPopoverVC: UIViewController, Storyboarded {
    //MARK: - IBOutlet
    @IBOutlet weak var tblSettings: UITableView!
    
    // MARK: - Properties
    var viewModel = SettingsPopoverViewModel()
    var onDoneBlock : ((Int) -> Void)?
    
    // MARK: - Constants
    private let disposeBag = DisposeBag()
    let reuseIdentifier = "SettingsPopoveCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
        
        viewModel.settingListModelObservable
            .bind(to: self.tblSettings
                    .rx
                    .items(cellIdentifier: reuseIdentifier,
                           cellType: SettingsPopoveCell.self)) { row, listitem, cell in
                
                cell.setCellData(listitem: listitem)
            }
            .disposed(by: disposeBag)
        
        
        tblSettings.rx.modelSelected(SettingsPopoverModel.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                self.viewModel.updateSelectedItem(item: model)
            }).disposed(by: disposeBag)
        
        tblSettings.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.initializeSettingItems()
        
        viewModel.isUpdated
            .subscribe(onNext: { [weak self] itemId in self?.selectSettingItem(id : itemId)})
            .disposed(by: disposeBag)
    }
    
    func selectSettingItem(id: Int) {
        
        if id != 0 {
            tblSettings.reloadData()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.onDoneBlock!(id)
                self.dismiss(animated: true)
            }
        }
    }
}
