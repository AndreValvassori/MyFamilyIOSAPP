//
//  MembrosViewController.swift
//  MyFamily
//
//  Created by Faczz on 19/07/19.
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import UIKit
import CoreData

class MembrosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var theSpot:Int = -3;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ModelData.shared.getData();
        // Do any additional setup after loading the view.
        ModelData.shared.getData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func deleteMembro(_ sender: Any) {
        if theSpot != -3
        {
            // Declare Alert message
            let dialogMessage = UIAlertController(title: "Exclusão", message: "Você tem certeza que deseja remover o membro \(String(describing: ModelData.shared.listaMembros[theSpot].nome))?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Sim", style: .default, handler: { (action) -> Void in
                if ModelData.shared.deleteData(theSpot: self.theSpot){
                    ModelData.shared.getData();
                    self.tableView.reloadData();
                }
            })
            let cancel = UIAlertAction(title: "Não", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)
            
            self.present(dialogMessage, animated: true, completion: nil)
            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ModelData.shared.listaMembros.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as UITableViewCell

            cell.textLabel?.text = ModelData.shared.listaMembros[indexPath.row].nome;
            cell.detailTextLabel?.text = "\(ModelData.shared.listaMembros[indexPath.row].idade)";
       
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print( "Row: \(indexPath.row)");
        theSpot=indexPath.row;
        
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
