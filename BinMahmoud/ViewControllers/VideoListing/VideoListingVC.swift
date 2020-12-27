//
//  VideoListingVC.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 08/12/2020.
//

import UIKit
import RxSwift
import RxCocoa

class VideoListingVC: SideMenuViewController, Storyboarded {
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputSearchView: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    let player = RxPlayer()
    
    // MARK: - Properties
    var viewModel: VideoListingViewModel?
    var isGridListing : Bool = true
    
    // MARK: UICollectionViw Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindToViewModel()
        
    }
    
    private func bindToViewModel() {
        guard let viewModel = viewModel  else {
            return
        }
        
        viewModel.isLoading
            .bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
                
        viewModel.videoListModelObservable
            .bind(to: self.collectionView.rx.items){ [ weak self] (collection: UICollectionView, index:Int, element: VideoListingModel) in
                guard let self = self else { return UICollectionViewCell()}
                let indexPath = IndexPath(item: index, section: 0)
                if  self.isGridListing {
                    return self.makeVideoGridListCell(with: element, collection: collection, indexpath: indexPath)
                }
                else {
                    return self.makeVideoListCell(with: element, collection: collection, indexpath: indexPath)
                }
                
            }.disposed(by: disposeBag)
        
        
        // Selected index
        collectionView.rx.itemSelected.asObservable()
                    .subscribe(onNext: { index in
                    print(index)
                }).disposed(by: disposeBag)
        
        // Selected item
        collectionView.rx.modelSelected(VideoListingModel.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                self.playItemAtIndex(item: model)
            }).disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.getVedioList()
    }
    
    
    //MARK:- Configure UICollectionView Cells accordingly
    private func makeVideoListCell(with: VideoListingModel, collection: UICollectionView, indexpath: IndexPath) -> VideoListCell{
        let cell = collection.dequeueReusableCell(withReuseIdentifier:"VideoListCell", for: indexpath) as! VideoListCell
        //Logger.info("Views : \(String(describing: with.views))")
        cell.setCellData(videoitem: with)
        return cell
    }
    
    private func makeVideoGridListCell(with: VideoListingModel, collection: UICollectionView, indexpath: IndexPath) -> VideoListGridCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier:"VideoListGridCell", for: indexpath) as! VideoListGridCell
        cell.setCellData(videoitem: with)
        //Logger.info("Views : \(String(describing: with.views))")
        return cell
    }
    
    

    //MARK:- Arranage list accordingly
    func reArrangeList(itemId: Int){
        
        if itemId == 1 {
            // Grid
            if isGridListing {
                return
            }
            isGridListing = true
        }
        else if itemId == 2 {
            // List
            if !isGridListing {
                return
            }
            isGridListing = false
        }
        else {
            // Sort
            guard let viewModel = viewModel else { return}
            viewModel.sortListBy(itemId: itemId)
        }
        collectionView.reloadData()
    }
    
    
    //MARK:- Play selected item
    func playItemAtIndex(item: VideoListingModel) {
        // Play youtube video
        if let is_youtue = item.is_youtube, is_youtue == 1 {
            viewModel?.onVideoTapAction.onNext(item)
        }
        else {
            //Play video from server
            player.playItem(item)
        }

    }
    
    // rightButtonAction
    @IBAction override func rightButtonAction(_ sender: UIBarButtonItem) {
        
        showSideMenu()
    }
    
    @IBAction override func leftButtonAction(_ sender: UIBarButtonItem) {
        
        showSettingsPopover(sender: sender)
    }
}
