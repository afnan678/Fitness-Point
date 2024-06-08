//
//  HomeVC.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 01/01/2024.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var yogaMusicCVHeight: NSLayoutConstraint!
    @IBOutlet weak var yogaMusicCV: UICollectionView!
    
    @IBOutlet weak var SeemoreBtn: UIButton!
    @IBOutlet weak var BellyImage: UIImageView!
    @IBOutlet weak var ArmImage: UIImageView!
    @IBOutlet weak var fullBodyImage: UIImageView!
    @IBOutlet weak var ButtImage: UIImageView!
    @IBOutlet weak var sliderImage: UIImageView!
    var yogaMusic = ["Sunrise","Harmony"]
    var yogaImages = [UIImage(named: "Yoga1"),UIImage(named: "Yoga2")]
    var CVHeight = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionVu()
        setLayout()
        configureUI()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true

    }
    
    
    func configureUI()
    {
        sliderImage.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sliderImageTapped))
        sliderImage.addGestureRecognizer(tapGesture)
        
        ButtImage.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(ButtImageTapped))
        ButtImage.addGestureRecognizer(tapGesture2)
        
        fullBodyImage.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(fullBodyImageTapped))
        fullBodyImage.addGestureRecognizer(tapGesture3)
        
        ArmImage.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(ArmImageTapped))
        ArmImage.addGestureRecognizer(tapGesture4)
        
        BellyImage.isUserInteractionEnabled = true // Enable user interaction
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(BellyImageTapped))
        BellyImage.addGestureRecognizer(tapGesture5)
        
        
        
        
        
    }
    
    @objc func sliderImageTapped() {
        // Handle the tap event
        types = "Arm"
        indexs = 0
        tabBarController?.selectedIndex = 1
        
    }
    
    @objc func ButtImageTapped() {
        // Handle the tap event
        types = "Butt"
        indexs = 2
        tabBarController?.selectedIndex = 1

    }
    
    @objc func fullBodyImageTapped() {
        // Handle the tap event
        types = "FullBody"
        indexs = 3
        tabBarController?.selectedIndex = 1

    }

    @objc func ArmImageTapped() {
        // Handle the tap event
        types = "Arm"
        indexs = 0
        tabBarController?.selectedIndex = 1

    }
    
    @objc func BellyImageTapped() {
        // Handle the tap event
        types = "Belly"
        indexs = 1
        tabBarController?.selectedIndex = 1

    }

    
    
    @IBAction func seeMoreBtnPressed(_ sender: Any) {
        if yogaMusic.count == 2
        {
            yogaMusic = ["Sunrise","Harmony","Stretch","Crunches"]
            yogaImages = [UIImage(named: "Yoga1"),UIImage(named: "Yoga2"), UIImage(named: "Belly2"), UIImage(named: "Body1")]
            SeemoreBtn.setTitle("See less  ", for: .normal)
            yogaMusicCV.reloadData()
        }
        else
        {
            yogaMusic = ["Sunrise","Harmony"]
            yogaImages = [UIImage(named: "Yoga1"),UIImage(named: "Yoga2")]
            SeemoreBtn.setTitle("See more", for: .normal)
            yogaMusicCV.reloadData()
        }
        
        yogaMusicCVHeight.constant = CGFloat(CVHeight * Double(yogaMusic.count/2))
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
        
        
        
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionVu() {
        yogaMusicCV.delegate = self
        yogaMusicCV.dataSource = self
        yogaMusicCV.register(UINib(nibName: "YogaMusicCVC", bundle: .main), forCellWithReuseIdentifier: "YogaMusicCVC")
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2.25,
                                 height: UIScreen.main.bounds.width/3)
        CVHeight = UIScreen.main.bounds.width/3 + 10
        yogaMusicCV.setCollectionViewLayout(layout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yogaMusic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: YogaMusicCVC = collectionView.dequeueReusableCell(withReuseIdentifier: "YogaMusicCVC", for: indexPath) as! YogaMusicCVC
        cell.titleLBL.text = yogaMusic[indexPath.row]
        cell.images.image = yogaImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tabBarController?.selectedIndex = 2
    }
    
}
