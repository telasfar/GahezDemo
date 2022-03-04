//
//  ViewController.swift
//  GahezDemo
//
//  Created by Tariq Maged on 28/02/2022.
//

import UIKit
import Combine


class ResturantsViewController: UIViewController {

    //vars
    var resturantViewModel = ResturantViewModel()
    private var cancelable = Set<AnyCancellable>()
    var resturantArr = [ResturantModel]()
    var resturantsTableView:TanibleView = {
        let tanibalview = TanibleView()
        tanibalview.direction = .right
        return tanibalview
    }()
    let btnSort:ButtonRounded = {
        let btn = ButtonRounded()
        btn.setTitle("SORT BY DISTANCE", for: .normal)
        btn.addTarget(self, action: #selector(btnSortPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        resturantViewModel.fetchResturants()
        resturantViewModel.$resturantModelArr.receive(on: RunLoop.main)
            .sink(receiveValue: {[weak self] resturants in
                self?.resturantArr = resturants ?? [ResturantModel]()
                self?.resturantsTableView.setNeedsDisplay()
                self?.resturantsTableView.reloadData()
            }).store(in: &cancelable)

    }

    func setupViews(){
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
        resturantsTableView.register(ResturantCell.self, forCellReuseIdentifier: ResturantCell.identifier)
        view.addSubview(btnSort)
        btnSort.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 60, leftConstant: 4, bottomConstant: 0, rightConstant: 4, widthConstant: 0, heightConstant: view.frame.height/12)
        view.addSubview(resturantsTableView)
        resturantsTableView.anchor(btnSort.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 2, leftConstant: 4, bottomConstant: 4, rightConstant: 4, widthConstant: 0, heightConstant: 0)
    }
    
    @objc func btnSortPressed() {
        resturantArr = resturantArr.sorted(by: {$0.distance ?? 0.0 < $1.distance ?? 0.0})
        resturantsTableView.direction = .inPlaceFadeInTop
        resturantsTableView.setNeedsDisplay()
        resturantsTableView.reloadData()
    }

}


extension ResturantsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturantArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResturantCell.identifier, for: indexPath) as? ResturantCell else {return UITableViewCell()}
        cell.resturant = resturantArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let resturantDetails = ResturantDetailsVC()
        resturantDetails.resturant = resturantArr[indexPath.row]
        navigationController?.pushViewController(resturantDetails, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
