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
    private var articleListVM:DataListViewModel!
    private var pullControl = UIRefreshControl()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                     #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    
    //MARK:- View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
   
    }
    
    
    //MARK: Pull to refresh Methods Implementation
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {

          refreshControl.endRefreshing()
           self.callGetApi()
             
    }
    

    //MARK:-  Webservice Calling
    
    func callGetApi(){
        
        if Reachability.shared.isConnectedToNetwork(){
            Webservices().getArtical {  [weak self] result in
                
                switch result{
                    
                case .success(let listDataModel):
                    
                    if let articles = listDataModel.rows{
                        self?.articleListVM = DataListViewModel(row: articles)
                        DispatchQueue.main.async {
                            self?.navigationItem.title = listDataModel.title
                            self?.displayTableView.reloadData()
                        }
                    }
            
                case .failure(let error):
                    print(error)
                    let alertController = UIAlertController(title: "", message:error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
                    self?.present(alertController, animated: true, completion: nil)
                }
            
            }
            
    
        }else{
            
            let alertController = UIAlertController(title: "", message: "No Internet Found!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {UIAlertAction in
            self.displayTableView.reloadData()
           }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
    
        }
        
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
        self.displayTableView.addSubview(self.refreshControl)
        
        callGetApi()
        
    }
    
    
    
    //MARK:- Tableview Datasource & Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numbrOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsinSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DisplayDataCell else{
            fatalError("Display Data Cell not found...")
        }
        
        cell.configure(with: self.articleListVM.dataAtIndex(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
