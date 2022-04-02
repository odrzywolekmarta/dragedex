//
//  LipsyncsTableViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

protocol LipsyncsViewModelProtocol {
    var dataSource: [LipSyncModel] { get }
    func updateDataSource()
}

class LipsyncsTableViewController: UITableViewController {
    
    let viewModel: LipsyncsViewModelProtocol
    let router: TabRouter
    
    init(viewModel: LipsyncsViewModelProtocol,
         router: TabRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        reloadData()
    }
    
    func reloadData() {
        viewModel.updateDataSource()
        tableView.reloadData()
    }

    func configureTableView() {
        let cellName = String(describing: SingleLipsyncTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleLipsyncTableViewCell.self),
                                                    for: indexPath) as? SingleLipsyncTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row])
            return cell
        }
        return SingleLipsyncTableViewCell()
    }
}
