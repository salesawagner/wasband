//
//  Cell.swift
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

let kCellIdentifier = "CellIdentifier"

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class - Cell
//
//**************************************************************************************************

class Cell: UITableViewCell {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func resetData() {
//		self.nameLabel.text = ""
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	func setup(_ viewModel: CellViewModel) {
//		self.photoImageView.WASsetImageWithUrl(viewModel.photoUrl)
//		self.nameLabel.text = viewModel.name
//		self.distanceLabel.text = viewModel.distance
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func awakeFromNib() {
        super.awakeFromNib()
		self.resetData()
//		self.setupPhotoImage()
    }
	
	override func prepareForReuse() {
		self.resetData()
	}
}
