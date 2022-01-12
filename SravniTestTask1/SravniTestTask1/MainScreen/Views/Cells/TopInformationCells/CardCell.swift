//
//  CardCell.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//

import UIKit

final class CardCell: UICollectionViewCell {
    
    static let identifier = "CardsCell"
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Цена ОСАГО каждый год меняется, то вверх, то вниз, даже если не было аварий. Разложим цену по полочкам"
        label.font = UIFont(name: "SFProText-Semibold", size: 15)
        label.textColor = SColors.main06
        return label
    }()
    
    private let contentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image-1")
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(data: TopInformationCards) {
        contentLabel.text = data.description
        contentImage.image = data.image
    }
    
    private func setupViews() {
        let views = [contentImage, contentLabel]
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            contentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contentImage.heightAnchor.constraint(equalToConstant: 44),
            contentImage.widthAnchor.constraint(equalToConstant: 44),
            
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 68),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            contentLabel.widthAnchor.constraint(equalToConstant: 214)
        ])
    }
}
