//
//  KGItemInfoView.swift
//  SHCourse
//
//  Created by Karina on 10/15/20.
//  Copyright © 2020 Karina. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class KGItemInfoView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = KGTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = KGTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubviews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor   = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .followers:
            symbolImageView.image   = SFSymbols.followers
            titleLabel.text         = "Followers"
        case .following:
            symbolImageView.image   = SFSymbols.following
            titleLabel.text         = "Following"
        case .gists:
            symbolImageView.image   = SFSymbols.gists
            titleLabel.text         = "Public gists"
        case .repos:
            symbolImageView.image   = SFSymbols.repos
            titleLabel.text         = "Public repos"
        }
        countLabel.text             = String(count)
    }
}
