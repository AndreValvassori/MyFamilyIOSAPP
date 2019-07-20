//
//  CadastroViewController.swift
//  MyFamily
//
//  Created by Faczz on 19/07/19.
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import UIKit
import CoreData

class CadastroViewController: UIViewController {

    @IBOutlet weak var tnome: UITextField!
    @IBOutlet weak var tsexo: UITextField!
    @IBOutlet weak var tidade: UITextField!
    
    
    @IBAction func addData(_ sender: Any) {
        if ModelData.shared.AddDataToDatabase(nome: tnome.text!, sexo: tsexo.text!, idade: tidade.text!) {
            tnome.text = "";
            tsexo.text = "";
            tidade.text = "";
            if let composeViewController = self.navigationController?.viewControllers[1] {//Here you mention your view controllers index, because navigation controller can store all VC'c in an array.
                print(composeViewController)
                self.navigationController?.popToViewController(composeViewController, animated: true)
            }
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

