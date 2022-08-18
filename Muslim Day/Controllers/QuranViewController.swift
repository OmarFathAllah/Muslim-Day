//
//  ViewController.swift
//  playSound
//
//  Created by omar  on 22/05/2022.
//

import UIKit
import AVFoundation

class QuranViewController: UIViewController {
    
//    properities
    static let identifier = String(describing: QuranViewController.self)
    @IBOutlet weak var quranTabelView: UITableView!
    var quranData = [SurahsReference]()
    
//    View Did Load function
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = false
        quranTabelView.delegate = self
        quranTabelView.dataSource = self
        
        // MARK: -  Get Quran Data from Json File
        quranData = GetDataFromJsonFile.shared.getQuranDataFromJson()
        quranTabelView.reloadData()
        registerCell()
    }

    func registerCell(){
        quranTabelView.register(UINib(nibName: QuranCell.identifier, bundle: nil), forCellReuseIdentifier: QuranCell.identifier)
    }
    
}
// MARK: -  Extension for tabel view delegate and datasource
extension QuranViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quranData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuranCell.identifier)as! QuranCell
        cell.cellContentSetup(cellData: quranData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: PlayerViewController.identifier)as! PlayerViewController
            let selectedIndex = indexPath.row
            vc.trackNo = selectedIndex
            vc.quranDataArray = quranData
            present(vc, animated: true, completion: nil)
    }
    
}



