//
//  MoreCoefficientCell.swift
//  SravniTestTask1
//
//  Created by Artem  on 09.12.2021.
//

import UIKit

final class MoreCoefficientCell: UITableViewCell {
    
    static let identifier = "MoreCoefficientCell"
    
    private lazy var separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = SColors.main10
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BT")
        return imageView
    }()
    
    private lazy var vectorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Vector")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        let string = setupFont(string: "БТ Базовый тариф", fontName: "SFProText-Regular", fontSize: 15, fontColor: SColors.accentBlue)
        label.attributedText = string
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        //label.text = "Устанавливается индивидуально каждой страховой от 2 471 до 5 436 Р"
        let string = setupFont(string: "Устанавливается индивидуально каждой страховой от 2 471 до 5 436 Р", fontName: "SFProText-Regular", fontSize: 13, fontColor: SColors.main30)
        label.attributedText = string
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(data: MoreCoefficient, needSeparator: Bool = true) {
        logoImage.image = data.image

        let yourAttributes = [NSAttributedString.Key.foregroundColor: SColors.accentBlue, NSAttributedString.Key.font: UIFont(name: "SFProText-Semibold", size: 15)]
        let yourOtherAttributes = [NSAttributedString.Key.foregroundColor: SColors.main100, NSAttributedString.Key.font: UIFont(name: "SFProText-Semibold", size: 15)]

        let partOne = NSMutableAttributedString(string: data.coefficient.title, attributes: yourAttributes as [NSAttributedString.Key : Any])
        let partTwo = NSMutableAttributedString(string: data.coefficient.description, attributes: yourOtherAttributes as [NSAttributedString.Key : Any])
        
        partOne.append(partTwo)

        titleLabel.attributedText = partOne
        informationLabel.text = data.moreDescription
        separatorView.isHidden = !needSeparator
    }
    
    private func setupFont(string: String, fontName: String, fontSize: CGFloat, fontColor: UIColor) -> NSAttributedString {
        let myFont = UIFont(name: fontName, size: fontSize)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: myFont,
            .foregroundColor: fontColor,
        ]
        let attributesString = NSAttributedString(string: string, attributes: attributes)
        return attributesString
    }
    
    private func setupViews() {
        contentView.addSubview(horizontalStackView)
        contentView.addSubview(separatorView)
        contentView.addSubview(vectorImage)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(informationLabel)
        horizontalStackView.addArrangedSubview(logoImage)
        horizontalStackView.addArrangedSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            vectorImage.heightAnchor.constraint(equalToConstant: 12),
            vectorImage.widthAnchor.constraint(equalToConstant: 6),
            vectorImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            vectorImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: vectorImage.leadingAnchor, constant: -19),
            horizontalStackView.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -12),
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            logoImage.heightAnchor.constraint(equalToConstant: 44),
            logoImage.widthAnchor.constraint(equalToConstant: 44),
        ])
    }
}
