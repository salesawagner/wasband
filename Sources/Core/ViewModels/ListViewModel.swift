//
//  ListViewModel.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class - BandListViewModel
//
//**************************************************************************************************

class ListViewModel: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************

	var title = L.list
	var cellViewModels: [CellViewModel] = [CellViewModel]()
	var detailViewModels: [DetailViewModel] = [DetailViewModel]()
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func addBand(_ band: Band) {
		let cellViewModel	= CellViewModel(band: band)
		let detailViewModel	= DetailViewModel(band: band)
		self.cellViewModels.append(cellViewModel)
		self.detailViewModels.append(detailViewModel)
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func requestBands(completion: @escaping CompletionSuccess) {
		let _ = BandManager.requestList(completion: { (success, bands) in
			if success {
				self.setupBands(bands)
				completion(true)
			} else {
				completion(false)
			}
		})
	}
	
	internal func setupBands(_ bands: [Band]?) {
		if let bands = bands {
			let bandsSorted = bands.sorted(by: {
				$0.name < $1.name
			})
			for band in bandsSorted {
				self.addBand(band)
			}
		}
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func loadBands(_ completion: @escaping CompletionSuccess) {
		self.requestBands(completion: completion)
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
