//
//  MainModel.swift
//  Sophie
//
//  Created by Rafael on 1/4/24.
//

import Foundation
import UIKit

enum MainModel {
    case bloodDonationCounter(donationCount: String?)
    case dayCounter(dayLeft: String?)
    case percentage(percentage: String?)
    case IngredientBlood(percentage: String)
    case wholeBlood(image: UIImage)
    case giftButton(gift: UIButton)
}
