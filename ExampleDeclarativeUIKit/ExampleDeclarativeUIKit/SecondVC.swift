//
//  SecondVC.swift
//  ExampleDeclarativeUIKit
//
//  Created by Lucas Pham on 4/17/20.
//  Copyright © 2020 phthphat. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let loadMoreBtn = UIButton(title: "Load more", titleColor: .systemBlue, target: self, action: #selector(loadMore))
    
    var data: [String] = ["abc", "xyz", "ghi", "klm", "pqr"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        vstack(tableView)
        self.view.addSubview(loadMoreBtn)
        
        loadMoreBtn.anchor(.bottom(self.view.bottomAnchor, constant: 50))
        loadMoreBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        tableView.dataSource = self; tableView.delegate = self
        tableView.register(UITableViewCell.self)
    }
    
    @objc func loadMore() {
        print("LoadMore")
        let arrData = ["abc", "xyz", "ghi", "klm", "pqr", "stu"]
        
        var lastIndex = self.data.count - 1
        let newIndexPaths = arrData.map { _ -> IndexPath in
            lastIndex += 1
            return IndexPath(row: lastIndex, section: 0)
        }
        
        data.append(contentsOf: arrData)
        tableView.performBatchUpdates({
            
            tableView.insertRows(at: newIndexPaths, with: .none)
        }, completion: nil)
    }
}

extension SecondVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == self.data.count - 3 {
//            self.loadMore()
//        }
        
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.data.count - 1 {
            self.loadMore()
        }
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath)
//        if indexPath.row == self.data.count - 1 {
//            self.loadMore()
//        }
    }
}


extension UITableView {
    public func register<T: UITableViewCell>(_ type: T.Type) {
        self.register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    public func dequeue<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(
            withIdentifier: String(describing: T.self),
            for: indexPath
        ) as! T
    }
}
