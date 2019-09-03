//
//  DetailViewController.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 17/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favouriteButton: UIButton!
    
    var output: DetailViewOutput!
    
    //MARK: - UIViewController overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }

    //MARK: - Actions
    
    @IBAction func tapFavouriteButton(_ sender: Any) {
        output.favouriteButtonTap()
    }
}

//MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    
    func set(image url: URL) {
        imageView.kf.indicatorType = .activity
        let resource = ImageResource(downloadURL: url)
        self.imageView.kf.setImage(with: resource, options: [.transition(.fade(1))])
    }
    
    func setText(_ text: String) {
        textLabel.text = text
    }
    
    func setButtonTitle(_ text: String) {
        favouriteButton.setTitle(text, for: .normal)
    }
}
