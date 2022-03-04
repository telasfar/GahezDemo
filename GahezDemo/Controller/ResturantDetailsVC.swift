//  ResturantDetailsVC.swift
//  GahezDemo
//
//  Created by Tariq Maged on 02/03/2022.
//

import UIKit
/*
class ResturantDetailsVC: UIViewController {
    
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var titleView: RoundedShadowView!
    
    //vars
    var event:ResturantModel?
    lazy var keyValueTupleArr:[(String,String)] = [
        ("Performer","\(event?.performers?.first?.name ?? "") "),
        ("And",event?.performers?.last?.name ?? "" ),
        ("Location",event?.venue?.extended_address ?? ""),
        ("Date",(event?.datetime_utc ?? "").convertDateString( fromFormat: "yyyy-MM-ddTHH:mm:ss a", toFormat: "dd/MM/YYYY HH:mm")),
        ("Num Future Event","\(event?.venue?.num_upcoming_events ?? 0)")
    ]
    let mainStackView:UIStackView = {
      let stackView = UIStackView()
      stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
      stackView.axis = .vertical
      return stackView
    }()
    let imageView:CachedImageView = {
        let iV = CachedImageView()
        iV.contentMode = .scaleAspectFill
        iV.layer.cornerRadius = 8
        iV.clipsToBounds = true
        return iV
    }()
    let btnFev:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(btnFevPressed), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillMainStackView()
        setupViews()
    }
    
    func setupViews(){
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 24),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        showCashedImage()
        
        view.addSubview(btnFev)
        btnFev.anchor(imageView.topAnchor, left: imageView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        handleBtnFev()
        
        view.addSubview(mainStackView)
        mainStackView.anchor(imageView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        btnBack.addTarget(self, action: #selector(btnBackPressed), for: .touchUpInside)
 
    }
    
    func showCashedImage(){
        if let imgUrl = event?.performers?.first?.image{
        shouldPresentLoadingView(true)
            imageView.loadImage(urlString:imgUrl) {
                DispatchQueue.main.async {
                    self.shouldPresentLoadingView(false)
                }
            }
        }
    }
    
    func fillMainStackView(){
        keyValueTupleArr.forEach{
            let stack = createMiniStackView(key: $0.0, value: $0.1 )
            mainStackView.addArrangedSubview(stack)
        }
    }
    
    func handleBtnFev(){
        if let eventID = event?.id{
             let isFev = Constants.fevoriteArr.contains(eventID)
            let img = isFev ? UIImage(systemName: "heart.fill"):UIImage(systemName: "heart")
            btnFev.setImage(img, for: .normal)
        }
    }
    
    @objc func btnFevPressed() {
        guard let id = event?.id else {return}
        if Constants.fevoriteArr.contains(id){
            btnFev.setImage(UIImage(systemName: "heart"), for: .normal)
            Constants.fevoriteArr = Constants.fevoriteArr.filter{$0 != id}
        }else{
            Constants.fevoriteArr.append(id)
            btnFev.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }

    func createMiniStackView(key:String,value:String)->UIStackView{
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.axis = .horizontal
        let lblKey = UILabel()
        lblKey.textAlignment = .left
        lblKey.text = key
        lblKey.font = UIFont.boldSystemFont(ofSize: 20)
        lblKey.textColor = #colorLiteral(red: 0.9955219626, green: 0.5297186375, blue: 0.2594603598, alpha: 1)
        stackView.addArrangedSubview(lblKey)
        let lblValue = UILabel()
        lblValue.textAlignment = .center
        lblValue.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        lblValue.font = UIFont.systemFont(ofSize: 18)
        lblValue.text = value
        lblValue.numberOfLines = 0
        stackView.addArrangedSubview(lblValue)
        return stackView
    }
    
    @objc func btnBackPressed(){
        dissmissDetail()
    }

}

*/
