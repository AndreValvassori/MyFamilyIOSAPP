//
//  ModelData.swift
//  MyFamily
//
//  Created by Faczz on 19/07/19.
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ModelData: NSObject {
    
    static let shared = ModelData()    
    var listaMembros:[Membro] = []
    
    var defaults = UserDefaults.standard;
    
    func AddDataToDatabase(nome:String,sexo:String,idade:String) -> Bool
    {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        
        let managedContext = appDelegate.persistentContainer.viewContext;
        
        let membroEntity = NSEntityDescription.entity(forEntityName: "Membro", in: managedContext)!
        
        let novomembro = NSManagedObject(entity: membroEntity, insertInto: managedContext)
        
        novomembro.setValue(nome, forKeyPath: "nome")
        novomembro.setValue(sexo, forKeyPath: "sexo")
        novomembro.setValue(Int(idade), forKeyPath: "idade")
        
        do{
            try managedContext.save()
            print("Salvo!");
            return true;
        } catch let error as NSError {
            print("Could not save. \(error)")
            return false;
        }
    }
    
    func getData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext;
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Membro");
        
        let sortDescriptor = NSSortDescriptor(key: "idade", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            ModelData.shared.listaMembros = try managedContext.fetch(fetchRequest) as! [Membro]
            print(ModelData.shared.listaMembros)
        } catch {
            print("failed");
        }
    }
    
    func deleteData(theSpot:Int) -> Bool{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let managedContext = appDelegate.persistentContainer.viewContext;
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Membro")
        fetchRequest.predicate = NSPredicate(format:"nome = %@", self.listaMembros[theSpot].nome!)
        
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
                return true
            }
            catch
            {
                print(error)
                return false
            }
        }
        catch{
            print(error)    
            return false
        }
    }
    
}
