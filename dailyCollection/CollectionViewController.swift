//
//  CollectionViewController.swift
//  dailyCollection
//
//  Created by Larry Mcdowell on 8/9/19.
//  Copyright © 2019 Larry Mcdowell. All rights reserved.
//

import UIKit



struct DataNode {
    var name:String
    var age:Int
    var title:String
}

class CollectionViewController: UICollectionViewController {
    let CELL_ID = "CELL_ID"
    var data:[DataNode]? = [DataNode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Daily CollectionView"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
       // collectionView.backgroundColor = .green
        let layoutOne = UICollectionViewFlowLayout()
       layoutOne.itemSize = CGSize(width: 150, height: 150)
        layoutOne.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layoutOne)
        collectionView.backgroundColor = .green
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell classes
        self.collectionView!.register(myCell.self, forCellWithReuseIdentifier: CELL_ID)
        prepareData()
        //UICollectionViewFlowLayout()
        //self.collectionViewLayout
        self.collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        // Do any additional setup after loading the view.
    }
    func prepareData(){
        
        data?.append(DataNode(name: "Nate", age: 42, title: "Coder"))
        data?.append(DataNode(name: "Sue", age: 38, title: "Tester"))
        data?.append(DataNode(name: "Tom", age: 56, title: "Debug"))
        data?.append((DataNode(name: "Phil", age: 63, title: "Sax")))
        data?.append(DataNode(name: "Rick", age: 65, title: "Keys"))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    
    
    // MARK: UICollectionViewDataSource

    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
       // print (data!.count)
        return data!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! myCell
    
        cell.data = data![indexPath.item]
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data![sourceIndexPath.item]
        data![destinationIndexPath.item] = item
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 150, height: 150)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 150)
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
