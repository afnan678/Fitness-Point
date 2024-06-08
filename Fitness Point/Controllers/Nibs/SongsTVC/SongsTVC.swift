//
//  SongsTVC.swift
//  Fitness Point
//
//  Created by Afnan Ahmed on 02/01/2024.
//

import UIKit

class SongsTVC: UITableViewCell {
    var buttonTappedCallback: (() -> Void)?
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var titleLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        buttonTappedCallback?()
    }
}
