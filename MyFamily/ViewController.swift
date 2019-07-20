//
//  ViewController.swift
//  MyFamily
//
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var tfamilia: UILabel!
    @IBOutlet weak var tmembros: UILabel!
    
  
    @IBAction func getdata(_ sender: Any) {
         ModelData.shared.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ModelData.shared.getData();
        tmembros.text = String(ModelData.shared.listaMembros.count);
        tfamilia.text = ModelData.shared.defaults.string(forKey: "Familia");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

