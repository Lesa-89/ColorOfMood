//
//  ResultController.swift
//  ColorOfMood
//
//  Created by macbook on 17/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

protocol ColorDelegate {
    func transferImage(_ image: UIImage)
}
class ResultController: UIViewController {
    
    var delegate: ColorDelegate?
    var viewColor: ColorType!
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultTextView: UITextView!
    
    @IBOutlet var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Цвет вашего настроения - \(viewColor.rawValue)"
        resultLabel.textColor = viewColor.colorUI
        resultImage.image = viewColor.image
        view.backgroundColor = viewColor.colorUI
        resultTextView.text = viewColor.definition
        
        resultLabel.layer.cornerRadius = 10
        resultTextView.layer.cornerRadius = 10
        doneButton.layer.cornerRadius = 10
        
    }
    
    func transferImage() {
        let newImage = viewColor.image
        delegate?.transferImage(newImage)
        
    }
    
    @IBAction func doneClick(_ sender: UIButton) {
    }
    
    
}

