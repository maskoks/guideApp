//
//  StageListVC.swift
//  guideApp
//
//  Created by Жеребцов Данил on 11.08.2021.
//

import UIKit

class StageListVC: UIViewController {
    
    let excursion = Excursion()
    
    @IBOutlet weak var excursionTitleLabel: UILabel!
    @IBOutlet weak var stackLabels: UIStackView!
    @IBOutlet weak var dismissVCButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        excursionTitleLabel.text = excursion.name
        setSwipe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.rowHeight = 44
    }
    
    func setSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissVC))
        swipe.direction = .down
        stackLabels.addGestureRecognizer(swipe)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func dismissVCButtonAction(_ sender: Any) {
        dismissVC()
    }
}
