//
//  FactsViewController.swift
//  GodSaveMe
//
//  Created by Адель Багаутдинов on 14/12/2018.
//  Copyright © 2018 Адель Багаутдинов. All rights reserved.
//

import UIKit

final class FactsViewController: UIViewController, FactsViewInput {
    
    //MARK: - Properties
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView?
    
    var output: FactsViewOutput!
    
    //MARK: - UIViewController overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    //MARK: - FactsViewInput

    func reload() {
        tableView.reloadData()
    }
    
    func startLoader() {
        activityIndicator?.startAnimating()
    }
    
    func stopLoader() {
        activityIndicator?.stopAnimating()
    }
    
    func showDetail() {
        performSegue(withIdentifier: "goDetail", sender: nil)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension FactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.dataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let fact = output.getFact(for: indexPath.row)
        cell.textLabel?.text = fact.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output.selectedCell(for: indexPath.row)
    }
}

//MARK: - Routing

extension FactsViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailViewController,
            let moduleInput = vc.output as? DetailModuleInput,
            let selectedFact = output.getSelectedFact() else { return }
        
        moduleInput.setFact(selectedFact)
    }
}
