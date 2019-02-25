//
//  ExamplesTableViewController.swift
//  AvoidKeyboard
//
//  Created by Cesar Bess on 23/02/19.
//  Copyright © 2019 Cesar Bess. All rights reserved.
//

import UIKit

class ExamplesTableViewController: UITableViewController {

    enum Examples: String {
        case scrollView = "Scroll View"
        case singleConstaint = "Single Constraint"
        case multipleConstraints = "Multiple Constraints"
    }

    let examples: [Examples] = [.scrollView, .singleConstaint, .multipleConstraints]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let example = examples[indexPath.row]
        cell.textLabel?.text = example.rawValue

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let example = examples[indexPath.row]

        switch example {
        case .scrollView:
            performSegue(withIdentifier: "scrollView", sender: nil)
        case .singleConstaint:
            performSegue(withIdentifier: "singleConstraint", sender: nil)
        default:
            break
        }
    }
}
