//: Playground - noun: a place where people can play

import UIKit

class Heap<T: Comparable> {
    enum HeapType {
        case min, max
    }
    
    let type: HeapType
    var elements: [T] = []
    
    var count: Int {
        return elements.count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    init(type: HeapType) {
        self.type = type
    }

    init(type: HeapType, array: [T]) {
        self.type = type
        self.elements = array
        buildHeap(array)
    }
    
    private func compare(_ el1: T, el2: T) -> Bool {
        if type == .min {
            return el1 < el2
        }
        else {
            return el1 > el2
        }
    }
    
    private func rightChildIndex(_ n: Int) -> Int {
        return 2*n + 2
    }
    
    private func leftChildIndex(_ n: Int) -> Int {
        return 2*n + 1
    }
    
    func parentIndexOf(_ n: Int) -> Int {
        return ((n - 1/2) - 1)
    }
    
    private func buildHeap(_ array: [T]) {
        let startIndex = array.count/2 - 1
        
        for index in stride(from: startIndex, through: 0, by: -1) {
            shiftDown(index)
        }
    }
    
    private func shiftUp(_ n: Int) {
        let parentIndex = parentIndexOf(n)

        if parentIndex >= 0 && compare(elements[n], el2: elements[parentIndex]) {
            elements.swapAt(n, parentIndex)
            shiftUp(parentIndex)
        }
    }
    
    private func shiftDown(_ n: Int) {
        shiftDown(n, endIndex: count - 1)
    }
    
    private func shiftDown(_ n: Int, endIndex: Int) {
        var index = n
        let leftIndex = leftChildIndex(index)
        let rightIndex = leftIndex + 1
        
        if leftIndex <= endIndex && compare(elements[leftIndex], el2: elements[index]) {
            index = leftIndex
        }
    
        if rightIndex <= endIndex && compare(elements[rightIndex], el2: elements[index]) {
            index = rightIndex
        }
    
        if index == n { return }
        
        elements.swapAt(index, n)
        shiftDown(index, endIndex: endIndex)
    }
    
    func insert(element: T) {
        elements.append(element)
        shiftUp(count - 1)
    }
    
    func remove() -> T? {
        var element:T?
        guard !isEmpty else { return nil }
        
        elements.swapAt(0, count - 1)
        element = elements.removeLast()
        shiftDown(0)
        
        return element
    }
}

extension Heap: CustomStringConvertible {
    var description: String {
        return "\(elements)"
    }
}

let array = [10, 20, 1, -192, 5, -27]
let heap = Heap<Int>(type: .min, array: array)
print(heap)

//heap.insert(element: -192)
//heap.insert(element: 10)
//heap.insert(element: 20)
//heap.insert(element: 1)
//heap.insert(element: 5)
//heap.insert(element: -27)

heap.remove()
print(heap)
heap.remove()
print(heap)
heap.remove()
print(heap)
heap.remove()
print(heap)
heap.insert(element: -99)
print(heap)

