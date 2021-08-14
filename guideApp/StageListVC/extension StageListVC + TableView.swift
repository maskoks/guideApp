//
//  extension StageListVC + TableView.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import Foundation
import UIKit

extension StageListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        excursion.stages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.serialNumberLabel.text = "\(excursion.stages[indexPath.row].serialNumber+1)/\(excursion.stages.count)"
        cell.titleLabel.text = excursion.stages[indexPath.row].title
        return cell

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC else { return }
        mainVC.provideModel(excursion: self.excursion)
        mainVC.modalPresentationStyle = .fullScreen
        excursion.selectedStageSerialNumber = excursion.stages[indexPath.row].serialNumber
        present(mainVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
