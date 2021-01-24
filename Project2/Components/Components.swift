//
//  Components.swift
//  Project2
//
//  Created by Guilherme Moraes on 24/01/21.
//

import Foundation
import UIKit

class Components {
    lazy var countryTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        return label
    }()
    
    
    lazy var flagButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.tag = 0
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    lazy var flagButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.tag = 1
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    lazy var flagButton3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.tag = 2
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
}
