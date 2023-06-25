//
//  LocationsViewController.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import UIKit

class LocationsViewController<View: LocationsView>: BaseViewController<View> {

    var selectLocation: ((LocationCellVM) -> Void)?

    private var cellsVM: [LocationCellVM] = []
    private var locationInfo: LocationsList.Info?

    private let dataProvider: LocationsDataProvider

    init(dataProvider: LocationsDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
        rootView.selectLocation = selectLocation
        rootView.willDisplay = { [weak self] index in
            guard let self, cellsVM.count > 0, cellsVM.count / 2 == index.row else {
                return
            }
            self.loadPage()
        }
        rootView.makeView()
        // HUD.show(.progress) TODO: make hud
        loadPage()
    }

    // MARK: - Actions

    @objc
    private func reload() {
        cellsVM = []
        rootView.update(viewModel: LocationsViewModel(cellsVM: []))
        locationInfo = nil
        loadPage()
    }

    // MARK: - Private

    private func setupBar() {
        title = L10n.Navbar.Title.locations
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(reload)
        )
    }

    private func loadPage() {
        let completion: (LocationsList?, ApiError?) -> Void = { [weak self] list, _ in
            guard let self else {
                return
            }
            guard let list else {
                // TODO: show error
                return
            }
            self.locationInfo = list.info
            self.cellsVM.append(contentsOf: list.results.map { LocationCellVM(location: $0) })
            self.rootView.update(viewModel: .init(cellsVM: self.cellsVM))
        }
        if let locationInfo {
            guard let nextPage = locationInfo.next else {
                return
            }
            dataProvider.locations(url: nextPage, completion: completion)
        } else {
            dataProvider.locations(page: 0, completion: completion)
        }
    }
}
