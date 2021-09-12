//
//  MovieCell.swift
//  MovieApp
//
//  Created by Young on 2021/09/12.
//

import UIKit


class MovieCell : UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!{
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        }
    }
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        }
    }
    @IBOutlet weak var priceLabel: UILabel!{
        didSet{
            descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        }
    }
}
