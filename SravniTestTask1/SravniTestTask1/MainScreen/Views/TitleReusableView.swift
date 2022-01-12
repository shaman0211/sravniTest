//
//  TitleReusableView.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//

import UIKit

final class TitleReusableView: UITableViewHeaderFooterView {
    
    static let identifier = "TitleView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        return label
    }()
    
    func config(title: String, size: CGFloat, inset: CGFloat = .zero, bgColor: UIColor = .white) {
        titleLabel.text = title
        titleLabel.font = UIFont(name: "SFProDisplay-Bold", size: size)
        contentView.backgroundColor = bgColor
        bottomInset.constant = -inset
    }
    
    private var bottomInset: NSLayoutConstraint!
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomInset = titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        self.bottomInset = bottomInset
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomInset
        ])
    }
    
    enum SizeOfTitle {
        case large
        case normal
        
        var size: CGFloat {
            switch self {
            case .normal:
                return 28
            case .large:
                return 20
            }
        }
    }
}


