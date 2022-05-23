//
//  SonucEkraniViewController.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 29.04.2022.
//

import UIKit

class SonucEkraniViewController: UIViewController {
    
    
    @IBOutlet weak var btnHata: UIButton!
    @IBOutlet weak var btnTekrarDene: UIButton!
    @IBOutlet weak var lblDogruSayisi: UILabel!
    @IBOutlet weak var lblBasariDurumu: UILabel!
    
    @IBOutlet weak var btnHatalariGor: UIButton!
    var dogruSayisi : Int?
    var yanlisSayisi : Int?
    var hatalar = [Bayraklar]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        btnHata.layer.cornerRadius = 15
        btnHata.layer.borderWidth = 2
        
        btnTekrarDene.layer.cornerRadius = 15
        btnTekrarDene.layer.borderWidth = 2
        
        
        
        lblDogruSayisi.text = "\(dogruSayisi!) DOĞRU, \(yanlisSayisi!) YANLIŞ"
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
