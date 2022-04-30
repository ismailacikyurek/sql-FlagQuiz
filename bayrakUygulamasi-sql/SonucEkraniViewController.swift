//
//  SonucEkraniViewController.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 29.04.2022.
//

import UIKit

class SonucEkraniViewController: UIViewController {
    
    
    @IBOutlet weak var lblDogruSayisi: UILabel!
    @IBOutlet weak var lblBasariDurumu: UILabel!
    
    @IBOutlet weak var btnHatalariGor: UIButton!
    var dogruSayisi : Int?
    var hatalar = [Bayraklar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDogruSayisi.text = "\(dogruSayisi!) DOĞRU, \(5-dogruSayisi!) YANLIŞ"
        lblBasariDurumu.text = "% \(dogruSayisi!*100/5) BAŞARI"
        navigationItem.hidesBackButton = true
        if dogruSayisi == 5 {
            btnHatalariGor.isHidden = true
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! HatalarVC
        gidilecekVC.hatalar = hatalar
 
    }
    

    @IBAction func tekrarDeneBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func hatalariGorBtn(_ sender: Any) {
    
    }
    
}
