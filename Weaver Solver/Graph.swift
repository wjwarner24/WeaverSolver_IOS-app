//
//  Graph.swift
//  Weaver Solver
//
//  Created by William Warner on 2/14/23.
//

import Foundation

class Graph {
    var words : Array<Word> = Array()
    
    init() {
        guard let fileURL = Bundle.main.url(forResource: "dictionary", withExtension: "txt") else {
            print("Could not find file")
            return  // Could not find file
        }
        
        do {
            let dictionaryString = try String(contentsOf: fileURL, encoding: .utf8)
            let strings = dictionaryString.components(separatedBy: .newlines)
            
            for str in strings {
                words.append(Word(str: str))
            }
            return
            
        } catch {
            print("Error reading dictionary file: \(error)")
            return
        }
        
    }
    
    public func addEdges() {
        guard let fileURL = Bundle.main.url(forResource: "edges", withExtension: "txt") else {
            print("Could not find file")
            return  // Could not find file
        }
        
        do {
            let dictionaryString = try String(contentsOf: fileURL, encoding: .utf8)
            let strings = dictionaryString.components(separatedBy: .newlines)
            
            for i in 0...strings.count - 2 {
                words[i].edges = getInts(strings[i])
            }
            return
            
        } catch {
            print("Error reading edges file: \(error)")
            return
        }
    }
    
    func getInts(_ input: String) -> [Int] {
        let components = input.split(separator: " ")
        var integers: [Int] = []
        
        for component in components {
            if let integer = Int(component) {
                integers.append(integer)
            }
        }
        
        return integers
    }
    
    func shortestPath(from: String, to: String) -> Array<String> {
        var fromIndex = 0
        var toIndex = 0
        var i = 0
        for word in words {
            if (word.name == from) {
                fromIndex = i
            }
            if (word.name == to) {
                toIndex = i
            }
            i += 1
        }
        var visited: Array<Bool> = Array()
        for _ in 0...words.count - 1 {
            visited.append(false)
        }
        var q: Queue<Int> = Queue()
        let g = Graph()
        q.enqueue(fromIndex)
        while (!q.empty() && !visited[toIndex]) {
            let u = q.head!
            q.dequeue()
            for i in 0...words[u].edges.count - 1 {
                let w = words[u].edges[i]
                if (!visited[w]) {
                    q.enqueue(w)
                    visited[w] = true
                    g.add_edge(from: w, to: u)
                }
            }
        }
        var path: Array<String> = Array()
        
        if (visited[toIndex]) {
            path.append(words[toIndex].name)
            while toIndex != fromIndex {
                toIndex = g.words[toIndex].edges[0]
                path.append(words[toIndex].name)
            }
        }
        return path
    }
    
    func printEdges(index: Int) {
        print(words[index].name)
        for i in words[index].edges {
            print(words[i].name)
        }
    }
    
    func add_edge(from: Int, to: Int) {
        words[from].edges.append(to)
    }
    
}

class Word {
    var name : String = ""
    var edges : Array<Int> = Array()
    init(str: String) {
        self.name = str
    }
}

struct Queue<T> {
  private var elements: [T] = []

  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
    
    func empty() -> Bool {
        if elements.isEmpty {
            return true
        }
        return false
    }
}
