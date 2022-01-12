//
//  OSAGOView.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//

//import UIKit
//
//final class OSAGOView: UIView {
//    
//    private var dataSource: [Coefficient] = []
//    
//    private lazy var contentVerticalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        return stackView
//    }()
////    
////    private lazy horizontalStackView: UIStackView = {
////        let stackView = UIStackView()
////        return stackView
////    }()
//    
//    
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Цена на ОСАГО"
//        //label.sizeThatFits(<#T##size: CGSize##CGSize#>)
//        label.font = UIFont.boldSystemFont(ofSize: 17.0)
//        label.textAlignment = .left
//        return label
//    }()
//    
//    private lazy var collectionView: UIResizableCollectionView = {
//        let collectionView = UIResizableCollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(OSAGOPriceCell.self, forCellWithReuseIdentifier: OSAGOPriceCell.identifier)
//        collectionView.isScrollEnabled = false
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collectionView
//    }()
//    
//    private lazy var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.scrollDirection = .horizontal
//        return layout
//    }()
//    
////    override var intrinsicContentSize: CGSize {
////        collectionView.setNeedsLayout()
////        collectionView.layoutIfNeeded()
////        collectionView.reloadData()
////        print(collectionView.collectionViewLayout.collectionViewContentSize.height)
////        return .init(width: super.intrinsicContentSize.width, height: super.intrinsicContentSize.height + collectionView.collectionViewLayout.collectionViewContentSize.height)
////    }
//    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
//            collectionView.layoutIfNeeded()
//            collectionView.frame = CGRect(x: 0, y: 0, width: targetSize.width , height: 1)
//            return collectionView.collectionViewLayout.collectionViewContentSize
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configurateDataSource(data: [Coefficient]) {
//        dataSource = data
//        collectionView.reloadData()
//    }
//    
//    private func setupViews() {
//        contentVerticalStackView.addArrangedSubview(collectionView)
//        let views = [titleLabel, contentVerticalStackView]
//
//        views.forEach {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//            addSubview($0)
//        }
//        
//        backgroundColor = UIColor(red: 244/255, green: 247/255, blue: 251/255, alpha: 1.0)
//        collectionView.backgroundColor = UIColor(red: 244/255, green: 247/255, blue: 251/255, alpha: 1.0)
//        layer.cornerRadius = 16
//        layer.masksToBounds = true
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
//            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//            titleLabel.heightAnchor.constraint(equalToConstant: 20),
//            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 107),
//            
//            contentVerticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
//            contentVerticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            contentVerticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            contentVerticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
//}
//
//extension OSAGOView: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OSAGOPriceCell.identifier, for: indexPath) as? OSAGOPriceCell else { return .init() }
//        cell.setupData(data: dataSource[indexPath.item])
//        return cell
//    }
//    
//}
//
//extension OSAGOView: UICollectionViewDelegateFlowLayout {
//    
//    
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
////        return CGSize(width: (collectionView.frame.width - 2 * 8 - flowLayout.sectionInset.left - flowLayout.sectionInset.right) / 3 , height: 52)
////    }
//}
