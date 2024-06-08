//
//  ViewController.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 31/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func letsStart(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarVC") as? TabbarVC
        vc?.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc!, animated: false)
    }
    
}

