//
//  HomeViewController.swift
//  BisaApa.com
//
//  Created by Stendy Antonio on 26/07/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var SaldoView: UIView!

    @IBOutlet weak var SliderImagCollectionView: UICollectionView!
    @IBOutlet weak var PageControlView: UIPageControl!

    @IBOutlet weak var DanaMendesakCollectionView: UICollectionView!

    @IBOutlet weak var PilihanBisaapaCollectionView: UICollectionView!
    
    
    var imgARR = [ UIImage(named: "Image1"),
                   UIImage(named: "Image2"),
                   UIImage(named: "Image3")
    ]

    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaldoView.layer.cornerRadius = 5
        SaldoView.layer.borderWidth = 0.5
        SaldoView.layer.borderColor = UIColor.gray.cgColor

        PageControlView.numberOfPages = imgARR.count
        PageControlView.currentPage = 0
        SliderImagCollectionView.layer.cornerRadius = 5
        

        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)

        }
        
    }
    
    @objc func changeImage(){
        if counter < imgARR.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.SliderImagCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageControlView.currentPage = counter
            counter += 1
        }
        else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.SliderImagCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            PageControlView.currentPage = counter
            counter = 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SliderImagCollectionView {
            return imgARR.count
        }
        else if collectionView == DanaMendesakCollectionView{
            return 5
        }
        else if collectionView == PilihanBisaapaCollectionView{
            return 10
        }

        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == SliderImagCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView{
                vc.image = imgARR[indexPath.row]
            }
            else if let ab = cell.viewWithTag(222) as? UIPageControl{
                ab.currentPage = indexPath.row
            }
            return cell

        }
        else if collectionView == DanaMendesakCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DanaMendesakCollectionViewCell

            return cell
        }
        else if collectionView == PilihanBisaapaCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as! PilihanBisaapaCollectionViewCell

            return cell
        }

       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DanaMendesakCollectionViewCell

        return cell

    }


    
}
