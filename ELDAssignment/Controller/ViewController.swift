//
//  ViewController.swift
//  ELDAssignment
//
//  Created by vivek bajirao deshmukh on 30/06/20.
//  Copyright © 2020 vivek bajirao deshmukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       //self.APICALL()
        self.initalization()
        
    }
    
    // MARK: - Intialization
    func initalization(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing+20, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
    }

    func APICALL(){
          //TODO: Call your api here
        let service = UserService()
             service.dofectlisting(pagenum: 6, limit: 6) { (result) in
                  if let user = result {
                      print(user)
                  }else{
                      print("Error")
                  }
                  
              }
    }

    
    
}


extension ViewController :UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 60
}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let numberOfItemsPerRow:CGFloat = 2
           let spacingBetweenCells:CGFloat = 30
           
           let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
           if let collection = self.collectionView{
               let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
               return CGSize(width: width, height: width)
           }else{
               return CGSize(width: 0, height: 0)
           }
//            flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 100.f);
        }
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           referenceSizeForHeaderInSection section: Int) -> CGSize {

           return CGSize(width: collectionView.bounds.width, height: 50)
       }
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath as IndexPath) as! CustomCollectionViewCell
    cell.lblDate.text = "Date"
    cell.lblTime.text = "Time"
//    let dictKeys  = Array(dictItems.keys)[indexPath.row]
//    let dictvalues = Array(dictItems.values)[indexPath.row]
//    cell.lblTitle.text = dictKeys
//    cell.imageView.image = UIImage(named: dictvalues)
    return cell
}
}
