//
//  ResultController.swift
//  ColorOfMood
//
//  Created by macbook on 17/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

protocol ColorDelegate {
    func transferColor(_ color: UIColor)
}
class ResultController: UIViewController {

    var delegate: ColorDelegate?
    var colorDescription: String!
    var viewColor: ColorType!
    
    @IBOutlet var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor.colorUI
        resultTextView.text = viewColor.definition
    }
    
    func transferColor() {
        let newColor = viewColor.colorUI
        delegate?.transferColor(newColor)
        
    }
    
    @IBAction func doneClick(_ sender: UIButton) {
    }
    

}

