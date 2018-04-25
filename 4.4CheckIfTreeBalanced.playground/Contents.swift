//: Playground - noun: a place where people can play

import UIKit

class BinaryTree<T> {
    let value: T
    var left: BinaryTree<T>?
    var right: BinaryTree<T>?
    
    init(value: T) {
        self.value = value
    }
    
//    func isTreeBalanced() -> Bool {
//        
//    }
    
    func treeHeight(_ depth: inout Int) {
        depth += 1
        left?.treeHeight(&depth)
        right?.treeHeight(&depth)
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

var height = 0
rootTwo.treeHeight(&height)
print(height)


