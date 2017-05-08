//
//  CustomTableViewCell.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    // MARK: Properties
    static let reusableIdentifier = "CustomCellIdentifier"
    static let nibName = "CustomTableViewCell"

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    private var traits: UIAccessibilityTraits = UIAccessibilityTraitNone

    // MARK: UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        traits = super.accessibilityTraits
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backgroundImageView.alpha = selected ? 0.6 : 1
        titleLabel.alpha = selected ? 0.7: 1
    }

    // MARK: UIAccessibilityElement
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            if isSelected {
                return traits | UIAccessibilityTraitSelected
            }
            return traits
        }
        
        set {
            traits = newValue
        }
    }

    // MARK: Public
    func configure(withImage image: UIImage, title: String) {

        backgroundImageView.image = image
        titleLabel.text = title
    }
}
