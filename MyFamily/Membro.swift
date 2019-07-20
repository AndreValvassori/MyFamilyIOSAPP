//
//  Membro.swift
//  MyFamily
//
//  Copyright © 2019 Avalvassori. All rights reserved.
//

import Foundation

import CoreData

@objc(Membro)
class Membro: NSManagedObject {
    @NSManaged var nome:String?
    @NSManaged var sexo:String?
    @NSManaged var idade:Int16
}
