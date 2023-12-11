//
//  ViewController.swift
//  09_10_2023_CollectionViewDemo
//
//  Created by Vishal Jagtap on 11/12/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var studentCollectionView: UICollectionView!
    var studentNames = ["Harsh", "Aaditya", "Rutik","Sambhaji", "Gajanan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        registerXIBWithCollectionView()
        
        print(self.studentCollectionView.frame.width)
    }
    
    func initializeCollectionView(){
        studentCollectionView.dataSource = self
        studentCollectionView.delegate = self
    }
    
    func registerXIBWithCollectionView(){
        let uiNib = UINib(nibName: "StudentCollectionViewCell", bundle: nil)
        self.studentCollectionView.register(uiNib, forCellWithReuseIdentifier: "StudentCollectionViewCell")
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        studentNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollectionViewCell", for: indexPath) as! StudentCollectionViewCell
        studentCollectionViewCell.backgroundColor = .cyan
        studentCollectionViewCell.studentNameLabel.text = studentNames[indexPath.item]
        return studentCollectionViewCell
    }
    
    
}


extension ViewController : UICollectionViewDelegate{
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenTheCells : CGFloat = (flowlayout.minimumInteritemSpacing ?? 0.0) + (flowlayout.sectionInset.left ?? 0.0) + (flowlayout.sectionInset.right ?? 0.0)
        
        let size = (self.studentCollectionView.frame.width - spaceBetweenTheCells) / 2.0
        return CGSize(width: size, height: size)
    }
}
