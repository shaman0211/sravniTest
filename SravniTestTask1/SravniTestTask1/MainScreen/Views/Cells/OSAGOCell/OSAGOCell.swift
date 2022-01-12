//
//  OSAGOCell.swift
//  SravniTestTask1
//
//  Created by Artem  on 09.12.2021.
//

import UIKit

final class OSAGOCell: UITableViewCell {
    
    static let identifier = "OSAGOCell"
    
    private let edgeInset: CGFloat = 16
    
    private var isConfigure = false
    
//    private lazy var view: OSAGOView = {
//        let view = OSAGOView()
//        return view
//    }()
    
    private func setupFont(string: String, fontName: String, fontSize: CGFloat, fontColor: UIColor) -> NSAttributedString {
        let myFont = UIFont(name: fontName, size: fontSize)!
        let attributes: [NSAttributedString.Key: Any] = [
            .font: myFont,
            .foregroundColor: fontColor,
        ]
        let attributesString = NSAttributedString(string: string, attributes: attributes)
        return attributesString
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Цена на ОСАГО"
        label.font = UIFont(name: "SFProText-Semibold", size: 17)
        label.textColor = SColors.main100
        label.textAlignment = .left
        return label
    }()
    
    private func getXLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "×"
        let string = setupFont(string: "×", fontName: "Ubuntu-Bold", fontSize: 14, fontColor: SColors.main20)
        label.attributedText = string
        return label
    }
    
    private lazy var equalSignLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let string = setupFont(string: "=", fontName: "Ubuntu-Bold", fontSize: 20, fontColor: SColors.main20)
        label.attributedText = string
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = SColors.main06
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var viewToRender = [UIView]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    func config(data: [Coefficient], width: CGFloat) {
        if isConfigure { return }
        for item in data.enumerated() {
            let view = NewOSAGOView()
            view.setupData(data: item.element)
            viewToRender.append(view)
            if item.offset < data.count - 1 {
                viewToRender.append(getXLabel())
            }
        }
        
        if !viewToRender.isEmpty {
            isConfigure = true
            layoutViews(with: width)
        }
    }
    
    private func layoutViews(with width: CGFloat) {
        containerView.addSubview(titleLabel)
        containerView.addSubview(equalSignLabel)
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: edgeInset),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -edgeInset),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 18),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: edgeInset),
            equalSignLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            equalSignLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
        
        var lastItem: UIView?
        let width = width - 2 * edgeInset
        var currentOffsetX: CGFloat = edgeInset
        var currentOffsetY: CGFloat = 18 + 14 + titleLabel.intrinsicContentSize.height
        var yOffsetCandidates = [CGFloat]()
        
        for item in viewToRender {
            let size = item.intrinsicContentSize
            
            if size.width + currentOffsetX > width {
                currentOffsetX = edgeInset
                currentOffsetY += yOffsetCandidates.max() + 12
                yOffsetCandidates.removeAll()
                lastItem = nil
            }
            
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
            
            var constraints = [
                item.topAnchor.constraint(equalTo: containerView.topAnchor, constant: currentOffsetY),
                item.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: currentOffsetX)
            ]
            
            if let lastItem = lastItem {
                constraints.append(item.centerYAnchor.constraint(equalTo: lastItem.centerYAnchor))
            }
            
            NSLayoutConstraint.activate(constraints)
            currentOffsetX += size.width + 8
            yOffsetCandidates.append(size.height)
            lastItem = item
        }
        
        if !yOffsetCandidates.isEmpty {
            currentOffsetY += yOffsetCandidates.max()
        }
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: currentOffsetY + edgeInset)
        ])
    }
    
    private func generateContainerStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Array where Element == CGFloat {
    func max() -> Element {
        var max: Element = .zero
        
        for item in self {
            if item > max {
                max = item
            }
        }
        
        return max
    }
}
