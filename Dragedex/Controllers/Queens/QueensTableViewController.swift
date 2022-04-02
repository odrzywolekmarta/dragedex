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
    
    let viewModel: QueensViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewModel: QueensViewModelProtocol,
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
        let cellName = String(describing: SingleQueenTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleQueenTableViewCell.self),
                                                    for: indexPath) as? SingleQueenTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row])
            cell.backgroundColor = .clear
            return cell
        }
        return SingleQueenTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.pushQueenDetails(with: viewModel.dataSource[indexPath.row])
    }
}
           
