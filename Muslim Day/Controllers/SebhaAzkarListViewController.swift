//
//  SebhaAzkarListViewController.swift
//  playSound
//
//  Created by omar  on 28/06/2022.
//

import UIKit

protocol getSelectedZekr {
    func getselectedZekr(zekr:String)
}

class SebhaAzkarListViewController: UIViewController {
    
    // MARK: -  properties
    var delegate:getSelectedZekr?
    var azkarArray:[String] = []
    static let identifier = String(describing: SebhaAzkarListViewController.self)
    @IBOutlet var azkarTableView: UITableView!
    
    // MARK: -  View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        initializeAzkarArray()
        azkarTableView.delegate = self
        azkarTableView.dataSource = self
    }
    
    func initializeAzkarArray(){
        azkarArray.append("لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كلّ شيءٍ قدير")
        azkarArray.append("أستغفر الله الذي لا إله إلا هو الحي القيوم وأتوب إليه")
        azkarArray.append("سبحان الله وبحمده سبحان الله العظيم")
        azkarArray.append("لا اله الا الله محمد رسول الله")
        azkarArray.append("حسبي الله ونعم الوكيل")
        azkarArray.append("لا حول ولا قوة الا بالله")
        azkarArray.append("سبحان الله والحمد لله")
        azkarArray.append(" الحمد لله")
        azkarArray.append("سبحان الله")
        azkarArray.append("استغفر الله")
        azkarArray.append("حسبي الله ونعم الوكيل")
        azkarArray.append("لا حول ولا قوة الا بالله")
        azkarArray.append("سبحان الله والحمد لله")
        azkarArray.append("أستغفر الله الذي لا إله إلا هو الحي القيوم وأتوب إليه")
        azkarArray.append("سبحان الله وبحمده سبحان الله العظيم")
    }
    
    private func registerCell(){
        azkarTableView.register(UINib(nibName: "MainAzkarTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "MainAzkarTitleTableViewCell")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: -  Table view delegate and data source
extension SebhaAzkarListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        azkarArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainAzkarTitleTableViewCell", for: indexPath)as! MainAzkarTitleTableViewCell
        cell.cellLabelText.text = azkarArray[indexPath.row]
        if indexPath.row < azkarArray.count{
            cell.zekrTitleNo.text = "\((indexPath.row) + 1)"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.delegate?.getselectedZekr(zekr: self.azkarArray[indexPath.row])
        }
    }
    
    
}
