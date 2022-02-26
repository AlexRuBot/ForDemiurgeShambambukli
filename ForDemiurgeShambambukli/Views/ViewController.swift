//
//  ViewController.swift
//  ForDemiurgeShambambukli
//
//  Created by Саша Гужавин on 25.02.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
        
    private let nameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Клеточное наполнение"
        lable.numberOfLines = 1
        lable.font = UIFont(name: "Roboto-Medium", size: 24)
        lable.textColor = .white
        return lable
    }()
    
    private let lifeTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "idCell")
        tableView.estimatedRowHeight = 72
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 8
        return tableView
    }()
    
    private let createButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.353, green: 0.204, blue: 0.447, alpha: 1)
        button.setTitle("Сотворить", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
    }()
    
    private let gradient: CAGradientLayer = {
       let gr = CAGradientLayer()
        gr.colors = [UIColor(red: 0.49, green: 0, blue: 0.8, alpha: 1).cgColor,
                     UIColor.black.cgColor]
        return gr
    }()
    
    private var lifeCells: [LifeModel] = []
    private let random: [LifeModel] = [LifeModel(image: Image.birth,
                                                backgroundColor: Color.birth,
                                                title: Title.birth,
                                                subTitle: SubTitle.birth),
                                      LifeModel(image: Image.skull,
                                                backgroundColor: Color.skull,
                                                title: Title.skull,
                                                subTitle: SubTitle.skull)]
    private var whereChicks: [Int] = []

    private let chick = LifeModel(image: Image.chick,
                          backgroundColor: Color.chick,
                          title: Title.chick,
                          subTitle: SubTitle.chick)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lifeTableView.delegate = self
        lifeTableView.dataSource = self
        setupViews()
        setupConstraints()
        
    }
    
    @objc func tap() {
        
        lifeCells.append(random.randomElement()!)
        
        if lifeCells.count >= 3 {
            let one = lifeCells[lifeCells.count - 3]
            let tow = lifeCells[lifeCells.count - 2]
            let three = lifeCells[lifeCells.count - 1]
            
            let cort = (one.image, tow.image, three.image)
            
            switch cort {
            case ("💥", "💥", "💥"):
                lifeCells.append(chick)
                whereChicks.append(lifeCells.count - 1)
                print("Жизнь!!!")
                lifeTableView.reloadData()
            case ("💀", "💀", "💀"):
                if whereChicks.count == 0 {
                    lifeTableView.reloadData()
                    return
                } else {
                    lifeCells.remove(at: whereChicks.last!)
                    print("Смерть!!!")
                    lifeTableView.reloadData()
                }
            default:
                print("мимо")
            }
        }
        lifeTableView.reloadData()
        scrollToBottom()

    }
    
    private func setupViews() {
        view.layer.addSublayer(gradient)
        view.addSubview(nameLable)
        view.addSubview(lifeTableView)
        view.addSubview(createButton)
    }
    
    private func setupConstraints() {
        
        gradient.frame = view.bounds
        
        nameLable.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(18)
        }
        
        
        
        createButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(18)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(18)
            make.height.equalTo(36)
        }
        
        lifeTableView.snp.makeConstraints { make in
            make.top.equalTo(nameLable.snp.bottom).offset(18)
            make.centerX.equalTo(view.center)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(18)
            make.bottom.equalTo(createButton.snp.top).offset(-18)
        }
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        lifeCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as! TableViewCell
        let lifeCell = lifeCells[indexPath.section]
        cell.configure(with: lifeCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.lifeTableView.numberOfRows(inSection:  self.lifeTableView.numberOfSections-1) - 1,
                section: self.lifeTableView.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.lifeTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < lifeTableView.numberOfSections && indexPath.row < lifeTableView.numberOfRows(inSection: indexPath.section)
    }
    
}

