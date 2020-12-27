//
//  CategoriesSideMenu.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 21/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class CategoriesSideMenu: UIViewController, Storyboarded {

    // MARK: - IBOutlets
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var viewModel: CategoriesSideMenuViewModel?
    private let disposeBag = DisposeBag()
    
    // MARK: - Constants
    let reuseIdentifier = "MenuCategoriesCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupBinding()
        bindToViewModel()
    }
        
    
    private func setupUI() {
        if Reference.IS_IPAD {
            tableview.estimatedRowHeight = 100;
        }
        else{
            tableview.estimatedRowHeight = 75;
            
        }
        tableview.rowHeight = UITableView.automaticDimension
    }
    
    
    private func bindToViewModel() {
        guard let viewModel = viewModel  else {
            return
        }
        
        viewModel.isLoading
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        tableview.dataSource = nil
        viewModel.categoriesListModelObservable
            .bind(to: self.tableview.rx
                    .items(cellIdentifier: reuseIdentifier,
                           cellType: MenuCategoriesCell.self)) { row, menuitem, cell in
                    cell.setCellData(menuitem: menuitem)
            }.disposed(by: disposeBag)

        // Selected item
        tableview.rx.modelSelected(CategoriesSideMenuModel.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                self.movetoSelectedCategory(category: model)
            }).disposed(by: disposeBag)
        
        viewModel.getCategoriesList()
    }
    
    private func setupBinding() {

        btnClose.rx.tap
            .bind { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
    }
    //MARK: - Push to category detail
    private func movetoSelectedCategory(category: CategoriesSideMenuModel) {
        
    }
}
