//
//  DetailedStackView.swift
//  GahezDemo
//
//  Created by Tariq Maged on 02/03/2022.
//

import UIKit

class DetailedStackView:UIStackView{
    var keyValueTupleArr:[(String,String)]?{
        didSet{
            fillStack()
        }
    }
    
    convenience init(keyValueTupleArr:[(String,String)]?){
        self.init()
        distribution = .fillEqually
        alignment = .fill
        axis = .vertical
        self.keyValueTupleArr = keyValueTupleArr
      }
    
    func fillStack(){
        guard let keyValueTupleArr = keyValueTupleArr else {return}
        keyValueTupleArr.forEach{
            let stack = createMiniStackView(key: $0.0, value: $0.1 )
            addArrangedSubview(stack)
        }
    }
    
    func createMiniStackView(key:String,value:String)->UIStackView{
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 2
        stackView.axis = .horizontal
        let lblKey = UILabel()
        lblKey.textAlignment = .left
        lblKey.text = key
        lblKey.font = UIFont.boldSystemFont(ofSize: 18)
        lblKey.textColor = #colorLiteral(red: 0.9955219626, green: 0.5297186375, blue: 0.2594603598, alpha: 1)
        stackView.addArrangedSubview(lblKey)
        let lblValue = UILabel()
        lblValue.textAlignment = .center
        lblValue.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        lblValue.font = UIFont.systemFont(ofSize: 16)
        lblValue.adjustsFontSizeToFitWidth = true
        lblValue.minimumScaleFactor = 0.5
        lblValue.text = value
        lblValue.numberOfLines = 0
        stackView.addArrangedSubview(lblValue)
        return stackView
    }
    
    func emptyViews(){
        for viewChild in arrangedSubviews{
            viewChild.removeFromSuperview()
        }
    }
}
