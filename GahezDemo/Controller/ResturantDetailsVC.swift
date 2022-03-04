//  ResturantDetailsVC.swift
//  GahezDemo
//
//  Created by Tariq Maged on 02/03/2022.
//

import UIKit

class ResturantDetailsVC: UIViewController {
    
    
    
    //vars
    var resturant:ResturantModel?
    let mainStackView:UIStackView = {
      let stackView = UIStackView()
      stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 4
      stackView.axis = .vertical
      return stackView
    }()
    let imageView:CachedImageView = {
        let iV = CachedImageView()
        iV.contentMode = .scaleAspectFit
        iV.layer.cornerRadius = 8
        iV.clipsToBounds = true
        return iV
    }()
    let containerView:UIView = {
        let conView = UIView()
        conView.backgroundColor = .clear
        return conView
    }()
    let equalStackView:UIStackView = {
      let stackView = UIStackView()
      stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 4
      stackView.axis = .horizontal
      return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(mainStackView)
        mainStackView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 72, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        mainStackView.addArrangedSubview(imageView)
        showCashedImage()
        
        mainStackView.addArrangedSubview(containerView)
        let lblName = createLbl(txt: resturant?.name ?? "")
        containerView.addSubview(lblName)
        lblName.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, topConstant: 2, leftConstant: 2, bottomConstant: 2, rightConstant: 0, widthConstant: containerView.frame.width/3, heightConstant: 0)
        let lblDescription = createLbl(txt: resturant?.description ?? "",false)
        containerView.addSubview(lblDescription)
        lblDescription.anchor(containerView.topAnchor, left: lblName.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 2, leftConstant: 2, bottomConstant: 2, rightConstant: 2, widthConstant: 0, heightConstant: 0)
        
        mainStackView.addArrangedSubview(equalStackView)
        
        let lblHours = createLbl(txt: resturant?.hours ?? "")
        equalStackView.addArrangedSubview(lblHours)
        
        let lblRating = createLbl(txt: "\(resturant?.rating ?? 0.0)",false)
        equalStackView.addArrangedSubview(lblRating)
        
    }
    
    func createLbl(txt:String,_ isBlue:Bool = true)->UILabel{
        let lblValue = UILabel()
        lblValue.textAlignment = .center
        lblValue.textColor = isBlue ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1):#colorLiteral(red: 0.9955219626, green: 0.5297186375, blue: 0.2594603598, alpha: 1)
        lblValue.font = UIFont.systemFont(ofSize: 16)
        lblValue.adjustsFontSizeToFitWidth = true
        lblValue.minimumScaleFactor = 0.5
        lblValue.text = txt
        lblValue.numberOfLines = 0
        return lblValue
    }
    
    func showCashedImage(){
        if let imgUrl = resturant?.image{
        shouldPresentLoadingView(true)
            imageView.loadImage(urlString:imgUrl) {
                DispatchQueue.main.async {
                    self.shouldPresentLoadingView(false)
                }
            }
        }
    }

}


