//
//  SeasonsTableViewController.swift
//  Dragedex
//
//  Created by Majka on 30/03/2022.
//

import UIKit

protocol SeasonsViewModelProtocol {
    var dataSource: [SeasonSection] { get }
    func updateDataSource()
}

struct SeasonSection {
    let title: String
    let array: [SeasonModel]
}

class SeasonsTableViewController: UITableViewController {
    
    let viewModel: SeasonsViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewModel: SeasonsViewModelProtocol,
         router: TabRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(style: .grouped)
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
        let cellName = String(describing: SingleSeasonTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource[section].array.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.dataSource[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleSeasonTableViewCell.self), for: indexPath) as? SingleSeasonTableViewCell {
            let section = viewModel.dataSource[indexPath.section]
            let model = section.array[indexPath.row]
            cell.configure(with: model)
            return cell
        }
        return SingleSeasonTableViewCell()
    }
}
