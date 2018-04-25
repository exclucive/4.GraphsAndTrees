//: Playground - noun: a place where people can play

import UIKit

class BinaryTree<T> {
    typealias List = LinkedList<T> 
    
    let value: T
    var left: BinaryTree<T>?
    var right: BinaryTree<T>?
    
    init(value: T) {
        self.value = value
    }
 
    func listOfdepth() -> [List]? { 
        var depthMap:[Int: List] = [:]
        
        addNode(&depthMap, counter: 0)
        
        let list = depthMap.values  
        return list.sorted(by: { (l1, l2) -> Bool in
            return l1.count < l2.count
        })
    }
    
    func addNode(_ map: inout [Int: List], counter: Int) {        
        if let list = map[counter] {
           list.add(value: self.value)
        }
        else {
            map[counter] = List(array: [self.value])
        }
        
        left?.addNode(&map, counter: counter+1)
        right?.addNode(&map, counter: counter+1)
    }
}

typealias Tree = BinaryTree<Int>

let rootTwo = Tree(value: 2)
let one = Tree(value: 1)
let three = Tree(value: 3)
let four = Tree(value: 4)
let five = Tree(value: 5)
let six = Tree(value: 6)
let seven = Tree(value: 7)

rootTwo.left = one
rootTwo.right = three

one.left = four
one.right = five

three.left = six
three.right = seven


var result = ""
for list in rootTwo.listOfdepth()! {
    result += "\(list)\n" 
}
print(result)
