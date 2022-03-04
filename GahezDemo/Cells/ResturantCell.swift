//
//  ResturantCell.swift
//  GahezDemo
//
//  Created by Tariq Maged on 02/03/2022.
//

import UIKit

class ResturantCell:UITableViewCell{
    
    //vars
    var resturant:ResturantModel?{
        didSet{
            resturantImageView.loadImage(urlString:resturant?.image ?? "")
            let dist = String(format: "%.2f", resturant?.distance ?? 0.0)
            mainStackView.keyValueTupleArr = [
                ("Name",resturant?.name ?? ""),
                ("Distance","\(dist) Km")]
        }
    }

     var mainStackView = DetailedStackView(keyValueTupleArr:nil)
    static var identifier:String {
      return String(describing:   ResturantCell.self)
    }
    
    let resturantImageView:CachedImageView = {
        let iV = CachedImageView()
        iV.contentMode = .scaleAspectFit
        iV.layer.cornerRadius = 8
        iV.clipsToBounds = true
        return iV
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainStackView.emptyViews()
    }
    func configCell(){
        addSubview(resturantImageView)
        resturantImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resturantImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            resturantImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            resturantImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            resturantImageView.widthAnchor.constraint(equalTo: resturantImageView.heightAnchor)
            
        ])
        resturantImageView.loadImage(urlString:resturant?.image ?? "")
        addSubview(mainStackView)
        mainStackView.anchor(topAnchor, left: resturantImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)
    }
    
}
