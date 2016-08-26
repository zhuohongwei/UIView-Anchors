//
//  UIView+Anchors.swift
//
//  Created by Zhuo Hong Wei on 11/6/16.

import Foundation
import UIKit

class LayoutProperty {

    let item: AnyObject
    let attribute: NSLayoutAttribute

    init(item: AnyObject, attribute: NSLayoutAttribute) {
        self.item = item
        self.attribute = attribute
    }

    func eq(other: LayoutProperty, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .Equal,
            toItem: other.item, attribute: other.attribute,
            multiplier: multiplier,
            constant: constant
        )
    }

    func le(other: LayoutProperty, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .LessThanOrEqual,
            toItem: other.item, attribute: other.attribute,
            multiplier: multiplier,
            constant: constant
        )
    }

    func ge(other: LayoutProperty, multiplier: CGFloat = 1, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: other.item, attribute: other.attribute,
            multiplier: multiplier,
            constant: constant
        )
    }

    func eqConstant(constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .Equal,
            toItem: nil, attribute: .NotAnAttribute,
            multiplier: 0,
            constant: constant
        )
    }

    func leConstant(constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .LessThanOrEqual,
            toItem: nil, attribute: .NotAnAttribute,
            multiplier: 0,
            constant: constant
        )
    }

    func geConstant(constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: item, attribute: attribute,
            relatedBy: .GreaterThanOrEqual,
            toItem: nil, attribute: .NotAnAttribute,
            multiplier: 0,
            constant: constant
        )
    }

}

protocol LayoutSupport: class {

    var pLeft: LayoutProperty {  get }
    var pRight: LayoutProperty { get }
    var pTop: LayoutProperty { get }
    var pBottom: LayoutProperty { get }

    var pTrailing: LayoutProperty { get }
    var pLeading: LayoutProperty { get }

    var pCenterX: LayoutProperty { get }
    var pCenterY: LayoutProperty { get }

    var pWidth: LayoutProperty { get }
    var pHeight: LayoutProperty { get }

    var pLeadingMargin: LayoutProperty { get }
    var pTrailingMargin: LayoutProperty { get }
    var pTopMargin: LayoutProperty { get }
    var pBottomMargin: LayoutProperty { get }
    
}

extension UIView {

    func addSupportedLayoutGuide() -> LayoutSupport {

        if #available(iOS 9.0, *) {

            let guide = UILayoutGuide()
            self.addLayoutGuide(guide)
            return guide

        }

        let mockGuide = UIView(frame: CGRectZero)
        mockGuide.backgroundColor = UIColor.clearColor()
        mockGuide.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mockGuide)
        return mockGuide

    }

}

extension UIView: LayoutSupport {

    var pLeft: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Left)
    }

    var pRight: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Right)
    }

    var pTop: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Top)
    }

    var pBottom: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Bottom)
    }

    var pTrailing: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Trailing)
    }

    var pLeading: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Leading)
    }

    var pCenterX: LayoutProperty {
        return LayoutProperty(item: self, attribute: .CenterX)
    }

    var pCenterY: LayoutProperty {
        return LayoutProperty(item: self, attribute: .CenterY)
    }

    var pWidth: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Width)
    }

    var pHeight: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Height)
    }
    
    var pLeadingMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .LeadingMargin)
    }

    var pTrailingMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .TrailingMargin)
    }

    var pTopMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .TopMargin)
    }

    var pBottomMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .BottomMargin)
    }

}

@available(iOS 9.0, *)
extension UILayoutGuide: LayoutSupport {

    var pLeft: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Left)
    }

    var pRight: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Right)
    }

    var pTop: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Top)
    }

    var pBottom: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Bottom)
    }

    var pTrailing: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Trailing)
    }

    var pLeading: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Leading)
    }

    var pCenterX: LayoutProperty {
        return LayoutProperty(item: self, attribute: .CenterX)
    }

    var pCenterY: LayoutProperty {
        return LayoutProperty(item: self, attribute: .CenterY)
    }

    var pWidth: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Width)
    }

    var pHeight: LayoutProperty {
        return LayoutProperty(item: self, attribute: .Height)
    }

    var pLeadingMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .LeadingMargin)
    }

    var pTrailingMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .TrailingMargin)
    }

    var pTopMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .TopMargin)
    }

    var pBottomMargin: LayoutProperty {
        return LayoutProperty(item: self, attribute: .BottomMargin)
    }
    
}

