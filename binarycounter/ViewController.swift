//
//  ViewController.swift
//  binarycounter
//
//  Created by Omar Ihmoda on 1/17/18.
//  Copyright © 2018 Omar Ihmoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {


    var powers: [Int] = [1]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        var sum = 1
        for var idx in 1...15 {
            var new_power = self.powers[idx-1] * 10
            self.powers.append(new_power)
            sum += new_power
        }
        
        self.sumLabel.text = ("Total: \(sum)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.powers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        cell.rightLabel.text = String(self.powers[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    
    func cellButtonTapped(cell: CustomTableViewCell, increment: Bool) {
        let indexPath = self.tableView.indexPathForRow(at: cell.center)!
        let index = indexPath.row
        self.updatePowers(index, increment)
    }
    
    func updatePowers(_ index: Int, _ increment: Bool) {
        if increment {
            self.powers[index] = self.powers[index] + 1
        } else {
            self.powers[index] = self.powers[index] - 1
        }
        
        let start = index + 1
        let end = self.powers.count
        
        for idx in start..<end {
            let new_power = self.powers[idx-1] * 10
            self.powers[idx] = new_power
        }
        let sum = self.powers.reduce(0, +)
        self.sumLabel.text = String(sum)
        tableView.reloadData()
    }
    
}

