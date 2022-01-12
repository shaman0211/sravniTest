//
//  OSAGOPriceCell.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//
//
//import UIKit
//
//final class OSAGOPriceCell: UICollectionViewCell {
//    
//    static let identifier = "OSAGOPriceCell"
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        let myFont = UIFont(name: "SFProText-Regular", size: 17)!
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: myFont,
//            .foregroundColor: UIColor.blue,
//        ]
//        let attributesString = NSAttributedString(string: "БТ", attributes: attributes)
//        label.attributedText = attributesString
//        label.textAlignment = .left
//        return label
//    }()
//    
//    private lazy var descriptionLabel: UILabel = {
//        let label = UILabel()
//        let myFont = UIFont(name: "SFProText-Regular", size: 13)!
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: myFont,
//            //.foregroundColor: UIColor.blue,
//        ]
//        let attributesString = NSAttributedString(string: "Базовый тариф", attributes: attributes)
//        label.attributedText = attributesString
//        
//        label.textAlignment = .left
//        label.numberOfLines = 2
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    func setupData(data: Coefficient) {
//        titleLabel.text = data.title
//        descriptionLabel.text = data.description
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    
//    private func setupViews() {
//        let views = [titleLabel, descriptionLabel]
//        
//        views.forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview($0)
//        }
//        
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            //titleLabel.heightAnchor.constraint(equalToConstant: 20),
//            
//            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            //descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, constant: 107),
//            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            //descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
//        ])
//    }
//}
