//
//  EpisodesTableViewController.swift
//  Dragedex
//
//  Created by Majka on 02/04/2022.
//

import UIKit

protocol EpisodesViewModelProtocol {
    var dataSource: [EpisodeModel] { get }
    func updateDataSource()
}

struct StaticDataEpisodesViewModel: EpisodesViewModelProtocol {
    let dataSource: [EpisodeModel]
    func updateDataSource() {
        // static data, nothing to do here
    }
}

class EpisodesTableViewController: UITableViewController {
    
    let viewModel: EpisodesViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewModel: EpisodesViewModelProtocol,
         router: TabRouterProtocol) {
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
            let cellName = String(describing: SingleEpisodeTableViewCell.self)
            tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
        }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleEpisodeTableViewCell.self),
                                                    for: indexPath) as? SingleEpisodeTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row])
            return cell
        }
        return SingleEpisodeTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.dataSource[indexPath.row]
        router.pushEpisodeDetail(with: model)
    }
}
