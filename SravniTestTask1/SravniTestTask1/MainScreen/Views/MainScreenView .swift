//
//  MainScreenView .swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import Foundation
import UIKit

final class MainScreenView: UIViewController, MainScreenPresenterOutput {
    
    func dataChanged() {
        tableView.reloadData()
    }
    
    var presenter: MainScreenPresenterInput!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(NewTopInformationCell.self, forCellReuseIdentifier: NewTopInformationCell.identifier)
        tableView.register(OSAGOCell.self, forCellReuseIdentifier: OSAGOCell.identifier)
        tableView.register(MoreCoefficientCell.self, forCellReuseIdentifier: MoreCoefficientCell.identifier)
        tableView.register(TitleReusableView.self, forHeaderFooterViewReuseIdentifier: TitleReusableView.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: Init
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = SColors.main06
        setupViews()
        presenter.loadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: Setup constraints
private extension MainScreenView {
    private func setupViews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: UICollectionViewDataSource
extension MainScreenView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.dataSource[indexPath.section].items[indexPath.item]
        switch item {
        case .topInformationItem(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewTopInformationCell.identifier, for: indexPath) as? NewTopInformationCell else { fatalError("Problem cell") }
            cell.configData(data: data)
            return cell
        case .moreCoefficientItem(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoreCoefficientCell.identifier, for: indexPath) as? MoreCoefficientCell else { fatalError("Problem cell") }
            cell.config(data: data, needSeparator: indexPath.row != presenter.dataSource[indexPath.section].items.count - 1)
            cell.backgroundColor = .white
            return cell
        case .OSAGOItem(let data):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OSAGOCell.identifier, for: indexPath) as? OSAGOCell else { fatalError("Problem cell") }
            cell.config(data: data, width: tableView.frame.width)
            return cell
        
        }
    }
}

// MARK: UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
extension MainScreenView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = presenter.dataSource[indexPath.section].items[indexPath.row]
        switch item {
        case .topInformationItem:
            return 194
        default:
            return UITableView.automaticDimension
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleReusableView.identifier) as! TitleReusableView
        let sectionModel = presenter.dataSource[section]
        view.config(title: sectionModel.title,
                    size: sectionModel.titleSize,
                    inset: sectionModel.insets,
                    bgColor: sectionModel.bgColor)
      
        return view
    }
}
