//
//  TabBarController.swift
//  iosSchoolHH
//
//  Created by Анна on 15.02.2023.
//

import UIKit

class TabBarController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
    }
}
