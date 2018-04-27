//: Playground - noun: a place where people can play

import UIKit

class BinaryTree<T> {
    let value: T
    var left: BinaryTree<T>?
    var right: BinaryTree<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func isTreeBalanced() -> Bool {
        let leftHeight = treeHeight(left)
        let rightHeight = treeHeight(right)
        
        if (leftHeight - 1 == rightHeight) ||
            (rightHeight - 1 == leftHeight) ||
            (leftHeight == rightHeight) {
            return true
        }
        
        return false
    }
    
    func treeHeight(_ node: BinaryTree<T>?) -> Int {
        guard let node = node else {
            return 0
        }
        
        return 1 + max(treeHeight(node.left), treeHeight(node.right))
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

var height = rootTwo.treeHeight(rootTwo)
rootTwo.isTreeBalanced()


