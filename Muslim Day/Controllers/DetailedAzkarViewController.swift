//
//  MainViewController.swift
//  Azkar Almuslim
//
//  Created by omar  on 17/10/2021.
//


import UIKit

class DetailedAzkarViewController: UIViewController{
    
    var currentRepeatNo:Int?
    var specifidAzkarUrl:String!
    var updatedURL:String?
    var selectedAzkar : [AzkarData] = []
    
    @IBOutlet weak var azkarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        azkarTableView.delegate = self
        azkarTableView.dataSource = self
        azkarTableView.separatorStyle = .none
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updatUrl(uRl: specifidAzkarUrl)
        if let url = updatedURL{
            NetworkService.shared.getAzkarData(url: url) { (result) in
                switch result{
                case .success(let azkarData):
                    self.selectedAzkar = azkarData.array
                    DispatchQueue.main.async {
                        self.azkarTableView.reloadData()
                    }
//                    print(azkarData)
                case.failure(let error):
                    print(error)
                }
            }
        }else{
            return
        }
    }
    
    //    nib registerCell()
        func registerCell(){
            azkarTableView.register(UINib(nibName: "AzkarCell", bundle: nil), forCellReuseIdentifier: "AzkarCell")
        }
    
    func updatUrl(uRl: String) {
        var updatedUrl = uRl
        updatedUrl.insert("s", at: updatedUrl.index(updatedUrl.startIndex, offsetBy: 4))
        updatedURL = updatedUrl
//        print(updatedURL)
    }
}
  

extension DetailedAzkarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(morningEveningAzkar.count)
        return selectedAzkar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AzkarCell", for: indexPath) as! AzkarCell
        cell.azkarLabel.text = selectedAzkar[indexPath.row].Text
        cell.repaetNo.text = String(selectedAzkar[indexPath.row].repeatNo)
//        self.azkarTableView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? AzkarCell else {return}
        if selectedAzkar[indexPath.row].repeatNo > 0 {
            selectedAzkar[indexPath.row].repeatNo -= 1
            cell.repaetNo.text = String(selectedAzkar[indexPath.row].repeatNo)
            azkarTableView.reloadData()
        }
        

    }
}

// extension for table view to animate tabel view cell
/*
extension UITableView {
    func reloadWithAnimation() {
        self.reloadData()
        let tableViewHeight = self.bounds.size.width
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 3.0, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
 */
