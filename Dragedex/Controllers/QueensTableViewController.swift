//
//  QueensTableViewController.swift
//  Dragedex
//
//  Created by Majka on 23/03/2022.
//

import UIKit

protocol QueensViewModelProtocol {
    var dataSource: [QueenModel] { get }
    func updateDataSource()
}

class QueensTableViewController: UITableViewController {
    
    var viewModel: QueensViewModelProtocol?
    var router: TabRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        reloadData()
    }
    
    func reloadData() {
        viewModel?.updateDataSource()
        tableView.reloadData()
    }
    
    func configureTableView() {
        let cellName = String(describing: SingleQueenTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleQueenTableViewCell", for: indexPath) as? SingleQueenTableViewCell {
            if let dataSource = viewModel?.dataSource {
                let model = dataSource[indexPath.row]
                cell.configure(with: model)
            }
            return cell
        }
        return SingleQueenTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dataSource = viewModel?.dataSource {
            let model = dataSource[indexPath.row]
            router?.pushQueenDetails(with: model)
        }
    }
}
