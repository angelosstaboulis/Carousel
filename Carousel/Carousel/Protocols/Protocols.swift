//
//  Protocols.swift
//  Carousel
//
//  Created by Angelos Staboulis on 19/4/21.
//

import Foundation
protocol CarouselViewProtocol:AnyObject{
    func setHeaderView()
    func setupView()
    func makeResizeImages()
}
protocol CarouselArrowProtocol:AnyObject{
    func goLeft()
    func goRight()
}
