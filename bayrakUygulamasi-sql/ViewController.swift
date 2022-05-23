//
//  ViewController.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 29.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.alpha = 0.2
        VeriTabaniKopyalaa()
    }
    func VeriTabaniKopyalaa() {
        
        let bundleYOl = Bundle.main.path(forResource: "bayrakquiz", ofType:".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("bayrakquiz.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı zaten var. kopyalamaya gerek yok")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYOl!, toPath: kopyalanacakYer.path)
            }catch {
                print(error)
            }
        }
    }

}

