//
//  GradientView.swift
//  iChatsPro
//
//  Created by anduser on 07.06.2023.
//

import UIKit

final class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()
    private var startPoint: Point!
    private var endPoint: Point!
    private var colors: [UIColor] = []

    convenience init(
        startPoint: Point,
        endPoint: Point,
        colors: [UIColor]
    ) {
        self.init()
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.colors = colors
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
}

fileprivate extension GradientView {
    func configure() {
        layer.addSublayer(gradientLayer)
        setupGradient(from: startPoint, to: endPoint, colors: colors)
    }

    func setupGradient(from: Point, to: Point, colors: [UIColor]) {
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
        gradientLayer.frame = bounds
    }
}

enum Point {
    case topLeading
    case leading
    case bottomLeading
    case top
    case center
    case bottom
    case topTrailing
    case trailing
    case bottomTrailing

    var point: CGPoint {
        switch self {

        case .topLeading:
            return CGPoint(x: 0, y: 0)
        case .leading:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeading:
            return CGPoint(x: 0, y: 1.0)
        case .top:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .topTrailing:
            return CGPoint(x: 1.0, y: 0)
        case .trailing:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomTrailing:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}
