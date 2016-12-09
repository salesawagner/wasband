//
//  DetailViewController.swift
//  was
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
// MARK: - Class - DetailViewController
//
//**************************************************************************************************

class DetailViewController: WASViewController {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	var viewModel: DetailViewModel!
	var firstTime: Bool = true
	
	// Photo
	@IBOutlet weak var photoImageView: UIImageView!
	
	// Name
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var nameValueLabel: UILabel!
	
	// Genre
	@IBOutlet weak var genreLabel: UILabel!
	@IBOutlet weak var genreValueLabel: UILabel!
	
	// Country
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var countryValueLabel: UILabel!

	// Website
	@IBOutlet weak var websiteLabel: UILabel!
	@IBOutlet weak var websiteValueLabel: UILabel!
	
	// Loading
	@IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	private func setValues() {
		// Values
		self.nameValueLabel.text = self.viewModel.name
		self.genreValueLabel.text = self.viewModel.genre
		self.countryValueLabel.text = self.viewModel.country
		self.websiteValueLabel.text = self.viewModel.website
		// Photo
		self.photoImageView.WASsetImageWithUrl(self.viewModel.photoUrl)
		// Animation
		if !self.firstTime {
			UIView.animate(withDuration: 0.25, animations: {
				self.view.layoutIfNeeded()
			})
		} else {
			self.firstTime = false
		}
	}
	
	private func loadById() {
		self.loadingIndicatorView.startAnimating()
		self.viewModel.loadById { (success) in
			self.loadingIndicatorView.stopAnimating()
			if success {
				self.setValues()
			}
		}
	}
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************

	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.setValues()
		self.loadById()
    }
	
	override func setupUI() {
		super.setupUI()
		self.title						= self.viewModel.title
		self.nameLabel.text				= L.name.uppercased()
		self.genreLabel.text			= L.genre.uppercased()
		self.countryLabel.text			= L.country.uppercased()
		self.websiteLabel.text			= L.website.uppercased()
		self.nameValueLabel.text		= ""
		self.genreValueLabel.text		= ""
		self.countryValueLabel.text		= ""
		self.websiteValueLabel.text		= ""
	}
}
