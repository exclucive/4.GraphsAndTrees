//: Playground - noun: a place where people can play

import UIKit

class Vertex<T: Hashable>: Hashable {
    let value: T
    var neighbors:[Edge<T>] = []
    var degree: Int = 0
    var visited: Bool = false
    
    init(value: T) {
        self.value = value
    }

    var hashValue: Int {
        return value.hashValue
    }
    
    static public func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

class Edge<T: Hashable> {
    let destination: Vertex<T>
    let weight: Double
    
    init(destination: Vertex<T>, weight: Double = 0) {
        self.destination = destination
        self.weight = weight
    }
}

class Graph<T: Hashable> {
    typealias Node = Vertex<T>
    typealias Connection = Edge<T>

    var nodes: [T:Node] = [:]
    var directed = false
    
    init(directed: Bool) {
        self.directed = directed
    }
    
    // private
    private func allNodes(withDegree degree: Int) -> [Node]? {
        return nodes.values.filter({ (node) -> Bool in
            return node.degree == degree
        })
    }
    
    // public
    public func addNode(value: T) -> Node {
        guard let existingNode = nodes[value] else {
            let newNode = Node(value: value)
            nodes[value] = newNode
            
            return newNode
        }
        
        return existingNode
    }
    
    public func addEdge(from: Node, to: Node) {
        let edge = Connection(destination: to)
        from.neighbors.append(edge)
        to.degree += 1
        
        if directed == false {
            let edge = Connection(destination: from)
            to.neighbors.append(edge)
            from.degree += 1
        }
    }
    
    public func dfs(_ node: Node) -> [T] {
        var result = [node.value]
        node.visited = true
        
        for neighbor in node.neighbors {
            if neighbor.destination.visited == false {
                result += dfs(neighbor.destination)
            }
        }
        
        return result
    }
    
    func findPath(from: Node, to: Node) -> Bool {
        from.visited = true
        if from == to {
            return true
        }
        
        for neighbor in from.neighbors {
            let node = neighbor.destination
            if node.visited == false {
                return findPath(from: node, to: to)
            }
        }
        
        return false
    }
}

//let graph = Graph<String>(directed: true)
//let a = graph.addNode(value: "a")
//let b = graph.addNode(value: "b")
//let c = graph.addNode(value: "c")
//let d = graph.addNode(value: "d")
//let e = graph.addNode(value: "e")
//let f = graph.addNode(value: "f")
//let g = graph.addNode(value: "g")
//let h = graph.addNode(value: "h")
//
////a
//graph.addEdge(from: a, to: c)
//graph.addEdge(from: a, to: d)
//
////b
//graph.addEdge(from: b, to: d)
//
////c
//graph.addEdge(from: c, to: e)
//graph.addEdge(from: c, to: d)
//
////e
//graph.addEdge(from: e, to: h)
//
////f
//graph.addEdge(from: f, to: e)
//graph.addEdge(from: f, to: g)
//
////g
//graph.addEdge(from: g, to: h)


let graph = Graph<String>(directed: true)
let a = graph.addNode(value: "a")
let b = graph.addNode(value: "b")
let c = graph.addNode(value: "c")
let d = graph.addNode(value: "d")
let e = graph.addNode(value: "e")
let f = graph.addNode(value: "f")
let g = graph.addNode(value: "g")

graph.addEdge(from: a, to: c)
graph.addEdge(from: a, to: d)
graph.addEdge(from: b, to: d)
graph.addEdge(from: c, to: d)
graph.addEdge(from: c, to: e)
graph.addEdge(from: d, to: f)
graph.addEdge(from: d, to: g)
graph.addEdge(from: e, to: f)

graph.findPath(from: b, to: f)

