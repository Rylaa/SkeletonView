//
//  GradientPoints.swift
//  Skeleton Example
//
//  Created by Yusuf Demirkoparan on 15.01.2021.
//

import UIKit
typealias GetGradientPoint = (from: CGPoint, to: CGPoint)

public enum GradientDirection {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    

    var startPoint: GetGradientPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x: -1, y: 0.5), to: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (from: CGPoint(x: 1, y: 0.5), to: CGPoint(x: -1, y: 0.5))
        case .topBottom:
            return (from: CGPoint(x: 0.5, y: -1), to: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (from: CGPoint(x: 0.5, y: 1), to: CGPoint(x: 0.5, y: -1))
        case .topLeftBottomRight:
            return (from: CGPoint(x: -1, y: -1), to: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (from: CGPoint(x: 1, y: 1), to: CGPoint(x: -1, y: -1))
        }
    }
    
    var endPoint: GetGradientPoint {
        switch self {
        case .leftRight:
            return (from: CGPoint(x: 0, y: 0.5), to: CGPoint(x: 2, y: 0.5))
        case .rightLeft:
            return ( from: CGPoint(x: 2, y: 0.5), to: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return ( from: CGPoint(x: 0.5, y: 0), to: CGPoint(x: 0.5, y: 2))
        case .bottomTop:
            return ( from: CGPoint(x: 0.5, y: 2), to: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return ( from: CGPoint(x: 0, y: 0), to: CGPoint(x: 2, y: 2))
        case .bottomRightTopLeft:
            return ( from: CGPoint(x: 2, y: 2), to: CGPoint(x: 0, y: 0))
        }
    }

}
