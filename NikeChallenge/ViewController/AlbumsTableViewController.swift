//
//  AlbumsTableViewController.swift
//  NikeChallenge
//
//  Created by Avellaneda on 4/3/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UIViewController {
    let tableView = UITableView()
    let viewModel = AlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    /**
     Setup our table view and constraints!

     Calling this method from viewDidLoad to ensure we setup our UI properly,
     registering out tableview Cell and making our initial call to populate our list with data
     */
    func setupTableView()
    {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.tableFooterView = UIView(frame: .zero)

        //table view constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0).isActive = true
        
        viewModel.delegate = self
        viewModel.getMusic()
    }

}
