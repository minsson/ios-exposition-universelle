//
//  ExpositionListViewController.swift
//  Expo1900
//
//  Created by Do Yi Lee on 2021/07/08.
//

import UIKit

class ExpositionListViewController: UIViewController {
	private let cellReuseIdentifier = "ExpositionListCell"
    var expositionItems: [ExpositionItem]?
	
	@IBOutlet var expositionTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		expositionTableView.delegate = self
		expositionTableView.dataSource = self
        
        expositionItems = try? JSONParser.parse(name: "items", type: [ExpositionItem].self).get()
	}
}

extension ExpositionListViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expositionItems?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ExpositionListCell else {
			return UITableViewCell()
		}
        
        let expositionItem = expositionItems?[indexPath.row]
        cell.name.text = expositionItem?.name
        cell.shortDescription.text = expositionItem?.shortDescription
        cell.itemImage.image = expositionItem?.image
		return cell
	}
}
