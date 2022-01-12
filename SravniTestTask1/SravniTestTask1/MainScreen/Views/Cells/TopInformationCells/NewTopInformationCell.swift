//
//  NewTopInformationCell.swift
//  SravniTestTask1
//
//  Created by Artem  on 18.12.2021.
//

import UIKit

final class NewTopInformationCell: UITableViewCell {
    
    static let identifier = "TopInformationCell"
    
    private var dataSource: [TopInformationCards] = []
    
    private let colors = [SColors.topCardBlue, SColors.topCardPurple, SColors.topCardOrange, SColors.topCardGreen, SColors.topCardViolets]
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = SColors.main06
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 24, left: 12, bottom: 24, right: 12)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configData(data: [TopInformationCards]) {
        dataSource = data
        collectionView.reloadData()
    }
    
    private func setupViews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        //UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    
}


extension NewTopInformationCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.identifier, for: indexPath) as? CardCell else { return .init() }
        cell.setData(data: dataSource[indexPath.item])
        cell.contentView.backgroundColor = colors[indexPath.item]
        return cell
    }
    
}

extension NewTopInformationCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 238, height: 194)
    }
}
