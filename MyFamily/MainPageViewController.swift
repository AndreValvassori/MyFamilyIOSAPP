//
//  MainPageViewController.swift
//  MyFamily
//
//  Created by Faczz on 20/07/19.
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var lblFamilia: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFamilia.text = ModelData.shared.defaults.string(forKey: "Familia");
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func act_Start(_ sender: Any) {
        
        ModelData.shared.defaults.set(lblFamilia.text,forKey: "Familia")
        
        self.performSegue(withIdentifier: "VCForm", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
