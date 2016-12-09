//
//  ListViewController.Swift
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

private let kDetailSegue	= "DetailSegue"

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class - ListViewController
//
//**************************************************************************************************

class ListViewController: WASTableViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var viewModel: ListViewModel = ListViewModel()
	var refreshControl: UIRefreshControl!
	var openedViewController: UIViewController?
	var firstTime: Bool = true
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setupPullRefresh() {
		self.refreshControl = UIRefreshControl()
		self.refreshControl.addTarget(self, action: #selector(self.didRefresh(_:)), for: .valueChanged)
		self.tableView.addSubview(self.refreshControl)
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	internal func loadBands(completion: CompletionSuccess? = nil) {
		self.viewModel.loadBands { (success) in
			self.tableView.reloadData()
			completion?(success)
		}
	}
	
	internal func didRefresh(_ refreshControl: UIRefreshControl) {
		self.loadBands() { (success) in
			self.refreshControl.endRefreshing()
		}
	}
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupPullRefresh()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if self.firstTime {
			self.loadBands()
			self.firstTime = false
		}
	}
	
	override func setupUI() {
		super.setupUI()
		self.title = self.viewModel.title
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == kDetailSegue {
			if let viewController = segue.destination as? DetailViewController {
				if let viewModel = sender as? DetailViewModel {
					viewController.viewModel = viewModel
				}
			}
		}
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDataSource
//
//**********************************************************************************************************

extension ListViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.cellViewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell: UITableViewCell!
		cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)
		cell.textLabel?.text = self.viewModel.cellViewModels[indexPath.row].name
		cell.backgroundColor = UIColor.clear
		cell.textLabel?.textColor = UIColor.white
		return cell
	}
}

//**********************************************************************************************************
//
// MARK: - Extension - UITableViewDelegate
//
//**********************************************************************************************************

extension ListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailViewModels = self.viewModel.detailViewModels
		let detailViewModel = detailViewModels[indexPath.row]
		self.performSegue(withIdentifier: kDetailSegue, sender: detailViewModel)
	}
}
