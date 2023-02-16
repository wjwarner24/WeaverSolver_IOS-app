//
//  ResultsVC.swift
//  Weaver Solver
//
//  Created by William Warner on 2/8/23.
//

import UIKit
import SwiftUI

class ResultsVC: UIViewController {

    var leftText : String = ""
    var rightText : String = ""
    var path: Array<String> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        TopLabel.text = "Shortest path between \(leftText) and \(rightText)"
        path.reverse()
        print(path)
        if (path.count > 2) {
            label1.text = path[0]
            label2.text = path[1]
            label3.text = path[2]
        }
        if (path.count > 3) {
            label4.text = path[3]
        }
        if (path.count > 4) {
            label5.text = path[4]
        }
        if (path.count > 5) {
            label6.text = path[5]
        }
        if (path.count > 6) {
            label7.text = path[6]
        }
        if (path.count > 7) {
            label8.text = path[7]
        }
        if (path.count > 8) {
            label9.text = path[8]
        }
        if (path.count > 9) {
            label10.text = path[9]
        }
        
    }
    
    
    @IBOutlet weak var TopLabel: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
     @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var label6: UILabel!
    
    @IBOutlet weak var label7: UILabel!
    
    @IBOutlet weak var label8: UILabel!
    
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet weak var label10: UILabel!
    
    
    
    
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
