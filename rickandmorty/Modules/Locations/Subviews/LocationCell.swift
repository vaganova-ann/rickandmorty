//
//  LocationCell.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import UIKit

class LocationCell: UITableViewCell {

    var viewModel: LocationCellVM? {
        didSet {
            guard let viewModel else {
                return
            }
            update(with: viewModel)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var populationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func update(with viewModel: LocationCellVM) {
        nameLabel.text = viewModel.title
        populationLabel.text = viewModel.population
    }
}
