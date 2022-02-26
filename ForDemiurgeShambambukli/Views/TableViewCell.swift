//
//  TableViewCell.swift
//  ForDemiurgeShambambukli
//
//  Created by Саша Гужавин on 25.02.2022.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    private let image: UILabel = {
        let image = UILabel()
        image.text = Image.skull
        image.font = UIFont(name: "Roboto-Medium", size: 20)
        return image
    }()
    
    private let backView = GradientView()
    
    private let title: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Roboto-Medium", size: 20)
        lable.text = Title.birth
        return lable
    }()
    
    private let subTitle: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Roboto-Medium", size: 14)
        lable.text = SubTitle.birth
        return lable
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
    }
    
    func configure(with cell: LifeModel) {
        image.text = cell.image
        backView.color = cell.backgroundColor
        title.text = cell.title
        subTitle.text = cell.subTitle
        backView.layoutSubviews()
    }
    
    private func setupViews() {
        addSubview(backView)
        addSubview(image)
        addSubview(title)
        addSubview(subTitle)
    }
    
    private func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(16)
            make.top.equalTo(self.snp.top).offset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalTo(backView.snp.centerY)
            make.centerX.equalTo(backView.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.right).offset(16)
            make.top.equalTo(backView.snp.top)
        }
        
        subTitle.snp.makeConstraints { make in
            make.left.equalTo(backView.snp.right).offset(16)
            make.bottom.equalTo(backView.snp.bottom)
        }
    }
}
