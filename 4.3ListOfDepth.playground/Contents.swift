//: Playground - noun: a place where people can play

import UIKit

class BinaryTree<T> {
    let value: T
    let left: BinaryTree<T>?
    let right: BinaryTree<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func listOfdepth() -> [[LinkedList]] {
        var listOfNodes:[[LinkedList]] = []
        var nextNodes = [self]
        
        while let node = nextNodes.last {
            nextNodes.removeLast()
            
        }
        
        return listOfNodes
    }
}

//let linkedList = LinkedList<Int>(array: [1, 2, 3, 4, 5])
