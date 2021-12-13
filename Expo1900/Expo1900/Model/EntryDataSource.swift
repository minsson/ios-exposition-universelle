//
//  EntryDataSource.swift
//  Expo1900
//
//  Created by 박병호 on 2021/12/09.
//

import UIKit

class EntryDataSource: NSObject, UITableViewDataSource {
    static let entryCell = "entryCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KoreanEntry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.entryCell, for: indexPath) as? EntryTableViewCell,
              let entries = JSONParser<[KoreanEntry]>.decode(from: JSONFileName.koreanEntry) else {
                  return UITableViewCell()
        }
        
        let entry = entries[indexPath.row]
        
        cell.setCustomCellComponents(image: entry.imageName, title: entry.name, shortDescription: entry.shortDesc)

        return cell
    }
}
