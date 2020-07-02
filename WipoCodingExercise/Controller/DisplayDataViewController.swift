//
//  DisplayDataViewController.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import UIKit
import Foundation

class DisplayDataViewController : UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //MARK:- Variables
    
    let displayTableView = UITableView()
    private var pullControl = UIRefreshControl()
    
    
    //MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
    }
    
    
    //MARK: Pull to refresh Methods Implementation
    
    
    func pullToRefresh(){
        
        pullControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            displayTableView.refreshControl = pullControl
        } else {
            displayTableView.addSubview(pullControl)
        }
    }
    
    
    
    @objc private func refreshListData(_ sender: Any) {
        
        self.pullControl.endRefreshing()
        
    }
    
    
    //MARK:- Tableview Design Setup
    
    func initialSetup(){
        
        view.backgroundColor = .white
        view.addSubview(displayTableView)
        displayTableView.translatesAutoresizingMaskIntoConstraints = false
        displayTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        displayTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        displayTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        displayTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        displayTableView.dataSource = self
        displayTableView.delegate = self
        
        displayTableView.register(DisplayDataCell.self, forCellReuseIdentifier: "Cell")
        displayTableView.rowHeight = UITableView.automaticDimension
        displayTableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        
    }
    
    
    
    //MARK:- Tableview Datasource & Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DisplayDataCell else{
            fatalError("Display Data Cell not found...")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
