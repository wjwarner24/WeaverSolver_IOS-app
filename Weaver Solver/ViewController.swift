//
//  ViewController.swift
//  Weaver Solver
//
//  Created by William Warner on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        graph.addEdges()
    }

 
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var counter = 0
        for word in graph.words {
            if (LeftText.text == word.name || RightText.text == word.name) {
                counter += 1
            }
        }
        if counter != 2 {
           //show error that input is invalid
        }
        else {
            performSegue(withIdentifier: "ToResultsVC", sender: self)
        }
        
    }
    
    
    @IBOutlet weak var LeftText: UITextField!
    @IBOutlet weak var RightText: UITextField!
    var graph: Graph = Graph()
    var path: Array<String> = Array()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        path = graph.shortestPath(from: LeftText.text!, to: RightText.text!)
        if (segue.identifier == "ToResultsVC") {
            let destinationVC = segue.destination as? ResultsVC
            if let left = LeftText.text {
                if let right = RightText.text {
                    destinationVC?.path = path
                    destinationVC?.leftText = left
                    destinationVC?.rightText = right
                }
            }
        }
    }
}

