//
//  SeasonsTableViewController.swift
//  Dragedex
//
//  Created by Majka on 30/03/2022.
//

import UIKit

protocol SeasonsViewModelProtocol {
    var dataSource: [SeasonModel] {get}
    func updateDataSource()
}

class SeasonsTableViewController: UITableViewController {
    
    let viewModel: SeasonsViewModelProtocol
    let router: TabRouterProtocol
    
    init(viewmodel: SeasonsViewModelProtocol, router: TabRouterProtocol) {
        self.viewModel = viewmodel
        self.router = router
        super.init(nibName: String(describing: SeasonsTableViewController.self), bundle: nil)
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
    }
    
    func configureTableView() {
        let cellName = String(describing: SingleSeasonTableViewCell.self)
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SingleSeasonTableViewCell.self), for: indexPath) as? SingleSeasonTableViewCell {
            cell.configure(with: viewModel.dataSource[indexPath.row])
            return cell
        }
        return SingleSeasonTableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.pushSeasonsList()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
