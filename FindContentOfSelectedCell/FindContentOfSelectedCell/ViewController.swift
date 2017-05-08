//
//  ViewController.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var preselectedCellIndex: Int?

    @IBOutlet fileprivate weak var tableView: UITableView!
    fileprivate let images = [UIImage(named: "logo"), UIImage(named: "people")]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.accessibilityIdentifier = "myTableView"
        tableView.register(UINib(nibName: CustomTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.reusableIdentifier)

        guard let row = preselectedCellIndex else {
            return
        }
        tableView.selectRow(at: IndexPath(row: row, section: 0), animated: false, scrollPosition: .none)
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reusableIdentifier, for: indexPath)

        guard let customCell = cell as? CustomTableViewCell, let image = images[indexPath.row % 2] else {
            return cell
        }
        customCell.configure(withImage: image, title: "Cell At Row \(indexPath.row)")

        return customCell
    }
}
