//
//  ViewController.swift
//  Carousel
//
//  Created by Angelos Staboulis on 19/4/21.
//

import UIKit
import Toucan
class ViewController: UIViewController {
    let images = [UIImage(named: "image01"),UIImage(named: "image02"),UIImage(named: "image03"),UIImage(named: "image04")]
    var resizedImages:[UIImage]=[]
    @IBOutlet var carousel: Carousel!
    var counter:Int!=0
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController:CarouselViewProtocol {
    func setHeaderView(){
        carousel.lblTitle.text = "Carousel"
        carousel.lblTitle.textColor = .white
    }
    func setupArrows(){
        carousel.btnLeft.setTitle("Left", for: .normal)
        carousel.btnRight.setTitle("Right", for: .normal)
        carousel.btnLeft.addTarget(self, action: #selector(clickLeft(sender:)), for: .touchDown)
        carousel.btnRight.addTarget(self, action: #selector(clickRight(sender:)), for: .touchDown)
    }
    func makeResizeImages(){
        for item in 0..<images.count {
            let resizedImage = Toucan(image:images[item]!).resizeByScaling(CGSize(width: 768, height: 512)).image
            resizedImages.append(resizedImage!)
        }
        carousel.mainImage.image = resizedImages[counter]
    }
    func setupView(){
        setHeaderView()
        carousel.backgroundColor = .black
        setupArrows()
        makeResizeImages()
    }
}

extension ViewController:CarouselArrowProtocol{
    func goLeft() {
        if  counter == 0 {
            counter = images.count-1
            carousel.mainImage.image = resizedImages[counter]
        }
        else if counter > 0  {
            counter = counter - 1
            carousel.mainImage.image = resizedImages[counter]
        }
        else{
            counter = images.count-1
            carousel.mainImage.image = resizedImages[counter]
        }
    }
    func goRight() {
        if counter < images.count-1 {
            counter = counter + 1
            carousel.mainImage.image = resizedImages[counter]
        }
        else{
            counter = 0
            carousel.mainImage.image = resizedImages[counter]
        }
    }
    @objc func clickLeft(sender:UIButton){
        goLeft()
    }
    @objc func clickRight(sender:UIButton){
        goRight()
    }
}
