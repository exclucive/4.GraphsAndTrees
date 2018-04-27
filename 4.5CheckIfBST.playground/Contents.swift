//: Playground - noun: a place where people can play

import UIKit

class BinarySearchTree {
    let value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(value: Int) {
        self.value = value
    }
    
    func isBST(_ tree: BinarySearchTree) -> Bool {
        var isLeftBST = true
        if let left = tree.left {
            if left.value <= tree.value {
                isLeftBST = isBST(left)
            }
            else {
                isLeftBST = false
            }
        }
        
        var isRightBST = true
        if let right = tree.right {
            if right.value > tree.value {
                isRightBST = isBST(right)
            }
            else {
                isRightBST = false
            }
        }
        
        return isRightBST && isLeftBST
    }
    
}

typealias Tree = BinarySearchTree

//let eight = Tree(value: 8)
//let three = Tree(value: 3)
//let ten = Tree(value: 10)
//let one = Tree(value: 1)
//let six = Tree(value: 6)
//
//eight.left = three
//eight.right = ten
//
//three.left = one
//three.right = six
//
//eight.isBST(eight)

let two = Tree(value: 2)
let one = Tree(value: 1)
let three = Tree(value: 3)
let four = Tree(value: 4)
let five = Tree(value: 5)
let six = Tree(value: 6)
let seven = Tree(value: 7)

four.left = two
four.right = six

two.left = one
two.right = three

six.left = five
six.right = seven

four.isBST(four)

