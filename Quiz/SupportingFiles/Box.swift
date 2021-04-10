//
//  Box.swift
//  Quiz
//
//  Created by Sanchit Mittal on 10/04/21.
//

import Foundation

/** This Class used to handle boxing in the app*/
class Box<T>{
    
    typealias Listner = (T) -> Void
    
    var listner:Listner?
    
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
        listner?(value)
    }
    
    func bind(_ listner: Listner?) {
        self.listner = listner
    }
}
