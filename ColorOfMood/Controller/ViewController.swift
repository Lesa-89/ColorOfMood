//
//  ViewController.swift
//  ColorOfMood
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startImage: UIImageView!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var nameAppLabel: UILabel!
    
    var cornerRadius: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameAppLabel.layer.masksToBounds = true
        nameAppLabel.layer.cornerRadius = cornerRadius
        startButton.layer.cornerRadius = cornerRadius
    }
    
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        let resultVC = segue.source as! ResultController
        resultVC.delegate = self
        resultVC.transferImage()
    }
    
}

extension ViewController: ColorDelegate{
    func transferImage(_ image: UIImage) {
        startImage.image = image
    }
}
