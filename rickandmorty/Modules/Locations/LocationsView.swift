//
//  LocationsView.swift
//  rickandmorty
//
//  Created by Анна on 22.05.2023.
//

import UIKit

protocol LocationsView: UIView {
    var selectLocation: ((LocationCellVM) -> Void)? { get set }
    var willDisplay: ((IndexPath) -> Void)? { get set }

    func makeView()
    func update(viewModel: LocationsViewModel)
}

class LocationsViewImp: UIView, LocationsView {

    var selectLocation: ((LocationCellVM) -> Void)?
    var willDisplay: ((IndexPath) -> Void)?

    private var locationsVM: LocationsViewModel?
    private let tableView = UITableView()

    func makeView() {
        tableView.backgroundColor = .clear
        tableView.allowsSelectionDuringEditing = false
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: LocationCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: LocationCell.className)

        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    func update(viewModel: LocationsViewModel) {
        locationsVM = viewModel

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate

extension LocationsViewImp: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let locationsVM, locationsVM.cellsVM.count > indexPath.row  else {
            return
        }
        selectLocation?(locationsVM.cellsVM[indexPath.row])
    }

    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        willDisplay?(indexPath)
    }
}

// MARK: - UITableViewDataSource

extension LocationsViewImp: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locationsVM?.cellsVM.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let locationsVM,
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.className) as? LocationCell {
            cell.viewModel = locationsVM.cellsVM[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
