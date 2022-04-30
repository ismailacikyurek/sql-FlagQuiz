//
//  hucreCell.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 30.04.2022.
//

import UIKit

class hucreCell: UITableViewCell {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    
    @IBOutlet weak var lblDogrusu: UILabel!
    var hatalar = [Bayraklar]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
