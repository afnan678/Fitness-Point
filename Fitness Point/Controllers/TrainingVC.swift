//
//  TrainingVC.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 01/01/2024.
//

import UIKit

class TrainingVC: UIViewController {

    @IBOutlet weak var caloriesLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var exerciseLBL: UILabel!
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var FullBody: UIButton!
    @IBOutlet weak var ButtBtn: UIButton!
    @IBOutlet weak var BellyBtn: UIButton!
    @IBOutlet weak var ArmBtn: UIButton!
    @IBOutlet weak var trainingTV: UITableView!
    
    
    
//    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupTV()
        configureUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI()
    }
    
    @IBAction func bodyBtnPressed(_ sender: Any) {
        types = "FullBody"
        indexs = 3
        configureUI()
    }
    @IBAction func ButtBtnnPresssedd(_ sender: Any) {
        types = "Butt"
        indexs = 2
        configureUI()
    }
    @IBAction func BellyBtnPressed(_ sender: Any) {
        types = "Belly"
        indexs = 1
        configureUI()
    }
    @IBAction func armBtnPressed(_ sender: Any) {
        types = "Arm"
        indexs = 0
        configureUI()
    }
    
    func configureUI()
    {
        print(appdata[0].Train[0].Times)
        if types == "Arm"
        {
            ArmBtn.setTitleColor(UIColor(named: "BGColor1"), for: .normal)
            ButtBtn.setTitleColor(UIColor.white, for: .normal)
            BellyBtn.setTitleColor(UIColor.white, for: .normal)
            FullBody.setTitleColor(UIColor.white, for: .normal)
            sliderImage.image = UIImage(named: "ArmSlider")
            exerciseLBL.text = " Total: \(appdata[0].TotalExercise) exercises"
            timeLBL.text = "Time: \(appdata[0].time) mints"
            caloriesLBL.text = "\(appdata[0].caleries) calories"


        }
        else if types == "Butt"
        {
            ArmBtn.setTitleColor(UIColor.white, for: .normal)
            ButtBtn.setTitleColor(UIColor(named: "BGColor1"), for: .normal)
            BellyBtn.setTitleColor(UIColor.white, for: .normal)
            FullBody.setTitleColor(UIColor.white, for: .normal)
            sliderImage.image = UIImage(named: "ButtSlider")
            exerciseLBL.text = " Total: \(appdata[2].TotalExercise) exercises"
            timeLBL.text = "Time: \(appdata[2].time) mints"
            caloriesLBL.text = "\(appdata[2].caleries) calories"
        }
        else if types == "Belly"
        {
            ArmBtn.setTitleColor(UIColor.white, for: .normal)
            ButtBtn.setTitleColor(UIColor.white, for: .normal)
            BellyBtn.setTitleColor(UIColor(named: "BGColor1"), for: .normal)
            FullBody.setTitleColor(UIColor.white, for: .normal)
            sliderImage.image = UIImage(named: "BellySlider")
            exerciseLBL.text = " Total: \(appdata[1].TotalExercise) exercises"
            timeLBL.text = "Time: \(appdata[1].time) mints"
            caloriesLBL.text = "\(appdata[1].caleries) calories"
        }
        else if types == "FullBody"
        {
            ArmBtn.setTitleColor(UIColor.white, for: .normal)
            ButtBtn.setTitleColor(UIColor.white, for: .normal)
            BellyBtn.setTitleColor(UIColor.white, for: .normal)
            FullBody.setTitleColor(UIColor(named: "BGColor1"), for: .normal)
            sliderImage.image = UIImage(named: "FullBody")
            exerciseLBL.text = " Total: \(appdata[3].TotalExercise) exercises"
            timeLBL.text = "Time: \(appdata[3].time) mints"
            caloriesLBL.text = "\(appdata[3].caleries) calories"
        }
        trainingTV.reloadData()
    }
    
    
    
    
    
    
}


extension TrainingVC: UITableViewDelegate, UITableViewDataSource {
    
    func setupTV()
    {
        trainingTV.delegate = self
        trainingTV.dataSource = self
        trainingTV.register(UINib(nibName: "TrainingTVC", bundle: .main), forCellReuseIdentifier: "TrainingTVC")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appdata[indexs].Train.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingTVC", for: indexPath) as! TrainingTVC
        
        cell.titleImage.image = UIImage(named: "\(appdata[indexs].Train[indexPath.row].image)")
        cell.TitleLBL.text = "\(appdata[indexs].Train[indexPath.row].titel)"
        cell.KcalLBL.text = "\(appdata[indexs].Train[indexPath.row].Kcal)"
        cell.mintLBL.text = "\(appdata[indexs].Train[indexPath.row].Times)"
        cell.Begnnier.text = "\(appdata[indexs].Train[indexPath.row].state)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
    
}
