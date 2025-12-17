//
//  main.swift
//  ObserverExample
//
//  Created by Andrew Muncey on 17/12/2025.
//

import Foundation


class Student : ResultsPublicationObserver {
    func update(notice: String) {
        print("\(name): \"I'm going to check my results")
    }
    
    init (name: String) {
        self.name = name
    }
    
    var name: String
    
    
}

protocol ResultsPublicationObserver : AnyObject { //must be an object (not a struct)
    func update(notice: String)
}

//subject
class RegistryServices {
    
    var resultsObservers = [ResultsPublicationObserver]()
    
    
    func processResults() {
        
        print("Holding Awards assessment board")
        print("Results being processed")
        notifyObservers()
    }
    
    func notifyObservers() {
        for observer in resultsObservers {
            observer.update(notice: "Results are now available for checking")
        }
    }
    
    func register(observer: ResultsPublicationObserver){
        resultsObservers.append(observer)
    }
    
    func unRegister(observer: ResultsPublicationObserver) {
        resultsObservers.removeAll { registeredObserver in
            observer === registeredObserver
        }
    }
    
    
}




let studentA = Student(name: "Andy")
let studentB = Student(name: "Bethany")
let studentC = Student(name: "Chritina")

let registry = RegistryServices()

print("First year")
registry.register(observer: studentA)
registry.register(observer: studentB)

registry.processResults() //C is not notified

registry.unRegister(observer: studentA)

print("Second year")
registry.processResults()



