//
//  myCell.swift
//  dailyCollection
//
//  Created by Larry Mcdowell on 8/9/19.
//  Copyright © 2019 Larry Mcdowell. All rights reserved.
//

import UIKit

class myCell: UICollectionViewCell {
       var gameTimer: Timer?
    var counter:Int = 0
    
    var data:DataNode? {
        didSet{
            nameLabel.text = data!.name
            ageLabel.text = "\(data!.age)"
            titleLabel.text = data!.title
        }
    }
        
        
        override init(frame: CGRect) {
        super.init(frame: frame)
        
           contentView.layer.borderColor = UIColor.black.cgColor
            contentView.layer.borderWidth = 4
            contentView.layer.cornerRadius = 5
            contentView.addSubview(nameLabel)
            contentView.addSubview(ageLabel)
            contentView.addSubview(titleLabel)
            contentView.backgroundColor = UIColor(red:0.94, green:0.87, blue:0.80, alpha:1.0)
           
            //contentView.translatesAutoresizingMaskIntoConstraints = false //don't do this
            nameLabel.doConstraints(top: contentView.topAnchor, left: contentView.leadingAnchor, bottom: ageLabel.topAnchor, right: contentView.trailingAnchor, padTop: 10, padLeft: 10, padBottom: -10, padRight: -10, width: 0, height: 0)
            ageLabel.doConstraints(top: nameLabel.bottomAnchor, left: contentView.leadingAnchor, bottom: contentView.bottomAnchor, right: titleLabel.leadingAnchor, padTop: 10, padLeft: 10, padBottom: -10, padRight: -10, width: 0, height: 0)
            titleLabel.doConstraints(top: nameLabel.bottomAnchor, left: ageLabel.trailingAnchor, bottom: contentView.bottomAnchor, right: contentView.trailingAnchor, padTop: 10, padLeft: 10, padBottom: -10, padRight: -10, width: 0, height: 0)
             gameTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        }
    
    @objc func runTimedCode(){
        //print("ran")
        if (data!.name == "Nate"){
        ageLabel.text = "\(data!.age)"
        data!.age += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameLabel:UILabel = {
       let lbl = UILabel()
       // lbl.layer.cornerRadius = 5
        lbl.layer.borderColor = UIColor.black.cgColor
        lbl.layer.borderWidth = 2
        lbl.font = UIFont(name: "GillSans", size: 24)
        lbl.textColor = .white
        lbl.backgroundColor = .orange
        lbl.textAlignment = .center
        return lbl
    }()
    
    var ageLabel:UILabel = {
        let lbl = UILabel()
        lbl.layer.cornerRadius = 2
        //lbl.layer.borderColor = UIColor.black.cgColor
        //lbl.layer.borderWidth = 2
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "GillSans", size: 24)
        lbl.textColor = .white
        lbl.backgroundColor = .blue
        return lbl
    }()
    
    var titleLabel:UILabel = {
        let lbl = UILabel()
        //lbl.layer.cornerRadius = 5
        //lbl.layer.borderColor = UIColor.black.cgColor
        //lbl.layer.borderWidth = 2
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "GillSans", size: 20)
        lbl.textColor = .black
        //lbl.backgroundColor = .green
        return lbl
    }()
    
    
}
