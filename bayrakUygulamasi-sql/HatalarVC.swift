//
//  HatalarVC.swift
//  bayrakUygulamasi-sql
//
//  Created by İSMAİL AÇIKYÜREK on 30.04.2022.
//

import UIKit

class HatalarVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var hatalar = [Bayraklar]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hatalar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreCell", for: indexPath) as! hucreCell
        cell.imageViewPhoto.layer.borderWidth = 1
        cell.imageViewPhoto.image = UIImage(named: "\(hatalar[indexPath.row].bayrak_resim!)")
        cell.lblDogrusu.text = "\(hatalar[indexPath.row].bayrak_ad!)"
        return cell
      
    

    }
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    @IBAction func btnTekrarDEne(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
