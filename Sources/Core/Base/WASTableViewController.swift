//
//  WASTableViewController.swift
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
// MARK: - Class -
//
//**************************************************************************************************

class WASTableViewController: WASViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	@IBOutlet weak var tableView: UITableView!
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func setuptableView() {
		self.tableView.rowHeight						= UITableViewAutomaticDimension
		self.tableView.sectionFooterHeight				= 0
		self.tableView.tableFooterView					= UIView()
		self.tableView.showsVerticalScrollIndicator		= false
		self.tableView.showsHorizontalScrollIndicator	= false
		self.tableView.backgroundColor					= UIColor.clear
		self.tableView.backgroundView					= UIView()
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func setupUI() {
		super.setupUI()
		self.setuptableView()
	}
}
