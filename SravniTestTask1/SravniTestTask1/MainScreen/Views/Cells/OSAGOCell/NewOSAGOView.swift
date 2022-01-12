//
//  NewOSAGOView.swift
//  SravniTestTask1
//
//  Created by Artem  on 27.12.2021.
//

import UIKit

final class NewOSAGOView: UIStackView {
    
    //static let identifier = "OSAGOPriceCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let myFont = UIFont(name: "SFProText-Semibold", size: 17)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: myFont,
            .foregroundColor: SColors.accentBlue,
        ]
        let attributesString = NSAttributedString(string: "БТ", attributes: attributes)
        label.attributedText = attributesString
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let myFont = UIFont(name: "SFProText-Regular", size: 13)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: myFont,
            .foregroundColor: SColors.main100
        ]
        let attributesString = NSAttributedString(string: "Базовый тариф", attributes: attributes)
        label.attributedText = attributesString
        
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return .init(width: descriptionLabel.intrinsicContentSize.width, height: descriptionLabel.intrinsicContentSize.height + titleLabel.intrinsicContentSize.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: Coefficient) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
    private func setupViews() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(descriptionLabel)
    }
}
