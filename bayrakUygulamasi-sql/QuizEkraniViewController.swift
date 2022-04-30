//
//  QuizEkraniViewController.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 29.04.2022.
//

import UIKit

class QuizEkraniViewController: UIViewController {

    @IBOutlet weak var lblDogru: UILabel!
    @IBOutlet weak var lblYanlis: UILabel!
    @IBOutlet weak var lblSoruSayisi: UILabel!
    @IBOutlet weak var imageViewBayrak: UIImageView!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnD: UIButton!
    
    
    var sorular = [Bayraklar]()
    var yanlisSecenekler = [Bayraklar]()
    
    var dogruSoru = Bayraklar()
    
    var soruSayac = 0
    var dogruSayac = 0
    var yanlisSayac = 0
    
    var secenekler = [Bayraklar]()
    var seceneklerKAristirmaListesi = Set <Bayraklar>()
    
    var yanlisBilinenler : [Bayraklar] = [Bayraklar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewBayrak.layer.borderWidth = 2
       
        sorular = Bayraklardao().rasgele5Getir()
       
        soruYukle()
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekVC = segue.destination as! SonucEkraniViewController
        gidilecekVC.dogruSayisi = dogruSayac
        gidilecekVC.hatalar = yanlisBilinenler
       
    }
    
    
    func soruYukle() {
        lblSoruSayisi.text = "\(soruSayac + 1). SORU"
        lblDogru.text = "Doğru : \(dogruSayac)"
        lblYanlis.text = "Yanlış : \(yanlisSayac)"
        
        dogruSoru = sorular[soruSayac]
        imageViewBayrak.image = UIImage(named: "\(dogruSoru.bayrak_resim!)")
        
        yanlisSecenekler = Bayraklardao().rasgele3YanlisSecenekGetir(bayrak_id: dogruSoru.bayrak_id!)
        
        seceneklerKAristirmaListesi.removeAll()
        
        seceneklerKAristirmaListesi.insert(dogruSoru)
        seceneklerKAristirmaListesi.insert(yanlisSecenekler[0])
        seceneklerKAristirmaListesi.insert(yanlisSecenekler[1])
        seceneklerKAristirmaListesi.insert(yanlisSecenekler[2])
     
       
     
        
        secenekler.removeAll()
        
        for s in seceneklerKAristirmaListesi {
            secenekler.append(s)
            
        }
        
      
        btnA.setTitle(secenekler[0].bayrak_ad, for: .normal)
        btnB.setTitle(secenekler[1].bayrak_ad, for: .normal)
        btnC.setTitle(secenekler[2].bayrak_ad, for: .normal)
        btnD.setTitle(secenekler[3].bayrak_ad, for: .normal)
       
    }
  
    
    
    
    func dogruKontrol(button : UIButton) {
        let buttonYazi = button.titleLabel?.text
        let dogruCevap = dogruSoru.bayrak_ad
        
        if dogruCevap == buttonYazi {
            dogruSayac += 1
            lblDogru.textColor = UIColor.green
            lblYanlis.textColor = UIColor.black
        } else {
           
            yanlisBilinenler.append(dogruSoru)
            yanlisSayac += 1
            lblYanlis.textColor = UIColor.red
            lblDogru.textColor = UIColor.black
        }
        lblDogru.text = "Doğru : \(dogruSayac)"
        lblYanlis.text = "Yanlış : \(yanlisSayac)"
    }
    
    func soruSayacKontrol() {
        soruSayac += 1
        
        if soruSayac != 5 {
            soruYukle()
        } else {
            performSegue(withIdentifier: "toSonucEkrani", sender: nil)
        }
    }
    
    
    
    @IBAction func btnATikla(_ sender: Any) {
        dogruKontrol(button: btnA)
        soruSayacKontrol()
    }
    
    @IBAction func btnBTikla(_ sender: Any) {
        dogruKontrol(button: btnB)
        soruSayacKontrol()
    }
    @IBAction func btnCTikla(_ sender: Any) {
        dogruKontrol(button: btnC)
        soruSayacKontrol()
    }
    @IBAction func btnDTikla(_ sender: Any) {
        dogruKontrol(button: btnD)
        soruSayacKontrol()
    }
    
    
}
