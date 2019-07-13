//
//  ViewController.swift
//  Coin Flip
//
//  Created by Ahmet Mohammed on 7/3/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coinLbl: UILabel!
    
    var coinArray : [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinImageArray(count: 10, name: "Coin")
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func flipBtn(_ sender: Any) {
        flipCoinImages(imageView: imageView, images: coinArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.05 ) {
            self.flipCoin()
        }
    }
    
    
    func flipCoin() {
        let coins = [1,2]
        if let coin = coins.randomElement() {
            coin == 1 ? (coinLbl.text = "Heads") : (coinLbl.text = "Tails")
            coin == 1 ? (imageView.image = UIImage(named: "Heads")) : (imageView.image = UIImage(named: "Tails"))
        }
    }
    
   func coinImageArray (count : Int, name: String){
    for i in 1...count {
    let imageName = UIImage(named: "\(name)\(i)")
        coinArray.append(imageName!)
    }
    }
    
    func flipCoinImages(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
}

