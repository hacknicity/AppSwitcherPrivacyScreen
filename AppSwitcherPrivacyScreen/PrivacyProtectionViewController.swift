//
//  PrivacyProtectionViewController.swift
//  AppSwitcherPrivacyScreen
//
//  Created by Geoff Hackworth on 10/02/2020.
//  Copyright © 2020 Hacknicity. All rights reserved.
//

import UIKit

/// Simple view controller which shows a privacy message.
class PrivacyProtectionViewController: UITableViewController {

    init() {
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // In my opinion, it looks a bit better to position the label centred in the top two thirds of the screen rather than in the middle
        let labelHeight = view.bounds.height * 0.66
        (privacyLabel.frame, _) = view.bounds.divided(atDistance: labelHeight, from: .minYEdge)
    }

    private lazy var privacyLabel: UILabel = {
        let label = UILabel()

        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true

        label.textAlignment = .center
        label.textColor = .gray

        label.numberOfLines = 0
        label.text = "Content hidden\nto protect\nyour privacy"

        self.view.addSubview(label)

        return label
    }()
}
