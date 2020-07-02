//
//  DisplayDataCell.swift
//  WipoCodingExercise
//
//  Created by Devshashi on 03/07/20.
//  Copyright © 2020 Devshashi. All rights reserved.
//

import Foundation


import Foundation
import UIKit


class DisplayDataCell: UITableViewCell {
    
    
    //MARK: Implementation Image view
    
    let placeImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
     //MARK: Implementation Title label
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
      //MARK: Implementation Description Label
    
    let descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor =  .white
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    
    //MARk:  Designing of Cell
  

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(placeImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)

        // configure Image
        placeImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        placeImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        placeImageView.widthAnchor.constraint(equalToConstant:50).isActive = true
        placeImageView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
              let marginGuide = contentView.layoutMarginsGuide
          
              // configure Titlelabel
              contentView.addSubview(titleLabel)
              titleLabel.translatesAutoresizingMaskIntoConstraints = false
              titleLabel.leadingAnchor.constraint(equalTo: placeImageView.leadingAnchor,constant: 100).isActive = true
              titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
              titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
              titleLabel.numberOfLines = 0
              titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
              
              // configure DescriptionLabel
              contentView.addSubview(descriptionLabel)
              descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
              descriptionLabel.leadingAnchor.constraint(equalTo: placeImageView.leadingAnchor,constant: 100).isActive = true
              descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
              descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
              descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
              descriptionLabel.numberOfLines = 0
              descriptionLabel.font = UIFont(name: "Avenir-Book", size: 14)
              descriptionLabel.textColor = UIColor.lightGray
   
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    


}
