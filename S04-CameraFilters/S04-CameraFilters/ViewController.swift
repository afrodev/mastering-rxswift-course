//
//  ViewController.swift
//  S04-CameraFilters
//
//  Created by Humberto Vieira on 11/04/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.applyFilterButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
            let photosCVC = navC.viewControllers.first as? PhotoCollectionVC else {
                fatalError("segue destination")
        }
        
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] (image) in
            self?.updateUI(with: image)
            
        }).disposed(by: disposeBag)
        
    }
    
    private func updateUI(with image: UIImage) {
        self.photoImageView.image = image
        self.applyFilterButton.isHidden = false
    }
    
    @IBAction func applyFilterButtonPressed(_ sender: Any) {
        guard let sourceImage = self.photoImageView.image else {
            return
        }
        
        FilterService().applyFilter(to: sourceImage) { filteredImage in
            DispatchQueue.main.async {
                self.photoImageView.image = filteredImage
            }
        }
     }
    
}

