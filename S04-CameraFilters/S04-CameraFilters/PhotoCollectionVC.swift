//
//  PhotoCollectionVC.swift
//  S04-CameraFilters
//
//  Created by Humberto Vieira on 11/04/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import UIKit
import Photos

class PhotoCollectionVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePhotos()

    }
    
    private func populatePhotos() {
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized {
                // Access photos on library
            }
            
        }
    }

}
