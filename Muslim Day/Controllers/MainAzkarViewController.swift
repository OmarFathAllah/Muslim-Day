//
//  MainViewController.swift
//  Azkar Almuslim
//
//  Created by omar  on 08/01/2022.
//


import UIKit

class MainAzkarViewController: UIViewController {
    
    var mainAzkarTitleArray : [Azkar] = []
    var indexselcted: Int?
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        registerCell()
        didUpdateAzkar()
    }
    
//    get azkar MAin Title From JSON File
    func didUpdateAzkar() {
        guard let mainAzkarTitleArray = GetDataFromJsonFile.shared.getMainAzkarTitleFromJson() else { return }
        self.mainAzkarTitleArray = mainAzkarTitleArray
//                print(mainAzkarTitleArray)
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
    
//    nib registerCell()
    func registerCell(){
        mainTableView.register(UINib(nibName: "MainAzkarTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "MainAzkarTitleTableViewCell")
    }
}

// MARK: -  extension to add table view delegate and data scource
extension MainAzkarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainAzkarTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainAzkarTitleTableViewCell", for: indexPath) as! MainAzkarTitleTableViewCell
        let title = mainAzkarTitleArray[indexPath.row].TITLE
//        print(title)
        cell.cellLabelText.text = title
        if indexPath.row + 1 < mainAzkarTitleArray.count {
            cell.zekrTitleNo.text = "\(indexPath.row + 1)"
        }else{
            cell.zekrTitleNo.text = String(mainAzkarTitleArray.count)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
//        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
            self.indexselcted = indexPath.row
        let VC = storyboard?.instantiateViewController(identifier: "ChildAzkarViewController") as! DetailedAzkarViewController
        if let selectedindex = self.indexselcted{
            VC.specifidAzkarUrl = self.mainAzkarTitleArray[selectedindex].TEXT
            VC.title = mainAzkarTitleArray[selectedindex].TITLE
            navigationController?.pushViewController(VC, animated: true)
            modalPresentationStyle = .fullScreen
        }
    }
}

