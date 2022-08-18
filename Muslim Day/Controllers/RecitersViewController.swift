//
//  RecitersViewController.swift
//  playSound
//
//  Created by omar  on 31/05/2022.
//

import UIKit

protocol PassDataToPlayer {
    func passTitle(title:String)
    func pasUrl(url:String)
}

class RecitersViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    static let identifier = String(describing: RecitersViewController.self)

     //    properities
    var delegate:PassDataToPlayer?
    var recitaionData = [Recitation]()
    @IBOutlet weak var recitersTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
    //    View did load function
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        recitersTableView.delegate = self
        recitersTableView.dataSource = self
        
    //  get recitaion data from json
        recitaionData = GetDataFromJsonFile.shared.getRecitationDataFromJson()
//        print(recitaionData[0].apiURL)
        recitersTableView.reloadData()
    }
    func registerCell(){
        recitersTableView.register(UINib(nibName: SideMenuTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recitaionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath)as! SideMenuTableViewCell
        let prepairedBy = recitaionData[indexPath.row].preparedBy
        switch prepairedBy.count {
        case 1:
            let title = recitaionData[indexPath.row].preparedBy[0].title
            cell.cellTitle.text = title
        case 2:
            let title = recitaionData[indexPath.row].preparedBy[1].title
            cell.cellTitle.text = title
        default:
            let title = recitaionData[indexPath.row].preparedBy[0].title
            cell.cellTitle.text = title
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            let url = self.recitaionData[indexPath.row].apiURL
//            print(url)
            self.delegate?.pasUrl(url: url)
            let prepairedBy = self.recitaionData[indexPath.row].preparedBy
            switch prepairedBy.count {
            case 1:
                let title = self.recitaionData[indexPath.row].preparedBy[0].title
                self.delegate?.passTitle(title: title)
            case 2:
                let title = self.recitaionData[indexPath.row].preparedBy[1].title
                self.delegate?.passTitle(title: title)
            default:
                let title = self.recitaionData[indexPath.row].preparedBy[0].title
                self.delegate?.passTitle(title: title)
            }
        }
        
    }
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
