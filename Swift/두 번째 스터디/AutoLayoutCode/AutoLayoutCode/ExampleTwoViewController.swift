//
//  ExampleTwoViewController.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 13/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ExampleTwoViewController: UIViewController
class ExampleTwoViewController: UIViewController {

    // MARK: Properties
        // Top
    weak var topView: UIView?
    weak var leftLabel: CustomLabel?
    weak var centerLabel: CustomLabel?
    weak var rightLabel: CustomLabel?
    
        // Bottom
    weak var bottomView: UIView?
    weak var blackViewOne: CustomView?
    weak var blackViewTwo: CustomView?
    weak var blackViewThree: CustomView?
    weak var blackViewFour: CustomView?
    weak var blackViewFive: CustomView?
    weak var blackViewSix: CustomView?
    weak var blackViewSeven: CustomView?
    weak var blackViewEight: CustomView?
    weak var blackViewNine: CustomView?
    weak var blackViewTen: CustomView?
    weak var blackViewEleven: CustomView?
    weak var blackViewTwelve: CustomView?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: SetViews()
    func setViews() {
        navigationItem.title = "Example_02"
        view.backgroundColor = .white
        // MAKR: set top
        let tView = UIView()
        let llbl = CustomLabel(txtColor: .black, txtAlignment: .left, txt: "왼쪽 정렬")
        let clbl = CustomLabel(txtColor: .black, txtAlignment: .center, txt: "가운데 정렬")
        let rlbl = CustomLabel(txtColor: .black, txtAlignment: .right, txt: "오른쪽 정렬")
        tView.translatesAutoresizingMaskIntoConstraints = false
        llbl.translatesAutoresizingMaskIntoConstraints = false
        clbl.translatesAutoresizingMaskIntoConstraints = false
        rlbl.translatesAutoresizingMaskIntoConstraints = false
        
        topView = tView
        topView?.backgroundColor = .white
        leftLabel = llbl
        centerLabel = clbl
        rightLabel = rlbl
        
        guard let topView = topView, let leftLabel = leftLabel, let centerLabel = centerLabel, let rightLabel = rightLabel else {
            print("Error: setView -> set top")
            return
        }
        
        view.addSubview(topView)
        topView.addSubview(leftLabel)
        topView.addSubview(centerLabel)
        topView.addSubview(rightLabel)
        
            // topView
        let topConstraintForTopView = NSLayoutConstraint(item: topView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForTopView = NSLayoutConstraint(item: topView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.3, constant: 0)
        view.addConstraints([topConstraintForTopView, heightConstraintForTopView])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v0]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": topView]))
        
            // leftLabel
        let topConstraintForLeftLabel = NSLayoutConstraint(item: leftLabel, attribute: .top, relatedBy: .equal, toItem: topView, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraintForLeftLabel = NSLayoutConstraint(item: leftLabel, attribute: .height, relatedBy: .equal, toItem: topView, attribute: .height, multiplier: 0.33333, constant: 0)
        topView.addConstraints([topConstraintForLeftLabel, heightConstraintForLeftLabel])
        topView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": leftLabel]))
        
            // centerLabel
        let topConstraintForCenterLabel = NSLayoutConstraint(item: centerLabel, attribute: .top, relatedBy: .equal, toItem: leftLabel, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForCenterLabel = NSLayoutConstraint(item: centerLabel, attribute: .height, relatedBy: .equal, toItem: leftLabel, attribute: .height, multiplier: 1, constant: 0)
        topView.addConstraints([topConstraintForCenterLabel, heightConstraintForCenterLabel])
        topView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": centerLabel]))
        
            // rightLabel
        let bottomConstraintForRightLabel = NSLayoutConstraint(item: rightLabel, attribute: .bottom, relatedBy: .equal, toItem: topView, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForRightLabel = NSLayoutConstraint(item: rightLabel, attribute: .height, relatedBy: .equal, toItem: centerLabel, attribute: .height, multiplier: 1, constant: 0)
        topView.addConstraints([bottomConstraintForRightLabel, heightConstraintForRightLabel])
        topView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": rightLabel]))
        
        
        // MARK: set bottom
        let bView = UIView()
        let blViewOne = CustomView(bgColor: .black)
        let blViewTwo = CustomView(bgColor: .black)
        let blViewThree = CustomView(bgColor: .black)
        let blViewFour = CustomView(bgColor: .black)
        let blViewFive = CustomView(bgColor: .black)
        let blViewSix = CustomView(bgColor: .black)
        let blViewSeven = CustomView(bgColor: .black)
        let blViewEight = CustomView(bgColor: .black)
        let blViewNine = CustomView(bgColor: .black)
        let blViewTen = CustomView(bgColor: .black)
        let blViewEleven = CustomView(bgColor: .black)
        let blViewTwelve = CustomView(bgColor: .black)
        bView.translatesAutoresizingMaskIntoConstraints = false
        blViewOne.translatesAutoresizingMaskIntoConstraints = false
        blViewTwo.translatesAutoresizingMaskIntoConstraints = false
        blViewThree.translatesAutoresizingMaskIntoConstraints = false
        blViewFour.translatesAutoresizingMaskIntoConstraints = false
        blViewFive.translatesAutoresizingMaskIntoConstraints = false
        blViewSix.translatesAutoresizingMaskIntoConstraints = false
        blViewSeven.translatesAutoresizingMaskIntoConstraints = false
        blViewEight.translatesAutoresizingMaskIntoConstraints = false
        blViewNine.translatesAutoresizingMaskIntoConstraints = false
        blViewTen.translatesAutoresizingMaskIntoConstraints = false
        blViewEleven.translatesAutoresizingMaskIntoConstraints = false
        blViewTwelve.translatesAutoresizingMaskIntoConstraints = false
        
        
        bottomView = bView
        bottomView?.backgroundColor = .white
        blackViewOne = blViewOne
        blackViewTwo = blViewTwo
        blackViewThree = blViewThree
        blackViewFour = blViewFour
        blackViewFive = blViewFive
        blackViewSix = blViewSix
        blackViewSeven = blViewSeven
        blackViewEight = blViewEight
        blackViewNine = blViewNine
        blackViewTen = blViewTen
        blackViewEleven = blViewEleven
        blackViewTwelve = blViewTwelve
        
        guard let bottomView = bottomView, let blackViewOne = blackViewOne, let blackViewTwo = blackViewTwo, let blackViewThree = blackViewThree, let blackViewFour = blackViewFour, let blackViewFive = blackViewFive, let blackViewSix = blackViewSix, let blackViewSeven = blackViewSeven, let blackViewEight = blackViewEight, let blackViewNine = blackViewNine, let blackViewTen = blackViewTen, let blackViewEleven = blackViewEleven, let blackViewTwelve = blackViewTwelve else {
            print("Error: setView -> set bottom")
            return
        }

        view.addSubview(bottomView)
        bottomView.addSubview(blackViewOne)
        bottomView.addSubview(blackViewTwo)
        bottomView.addSubview(blackViewThree)
        bottomView.addSubview(blackViewFour)
        bottomView.addSubview(blackViewFive)
        bottomView.addSubview(blackViewSix)
        bottomView.addSubview(blackViewSeven)
        bottomView.addSubview(blackViewEight)
        bottomView.addSubview(blackViewNine)
        bottomView.addSubview(blackViewTen)
        bottomView.addSubview(blackViewEleven)
        bottomView.addSubview(blackViewTwelve)
        
            // bottomView
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bottomView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": topView, "v1": bottomView]))
        
        // blackViews
        let widthConstraintForBlackViewOne = NSLayoutConstraint(item: blackViewOne, attribute: .width, relatedBy: .equal, toItem: bottomView, attribute: .width, multiplier: 0.33333, constant: -11)
        let heightConstrainForBlackViewOne = NSLayoutConstraint(item: blackViewOne, attribute: .height, relatedBy: .equal, toItem: bottomView, attribute: .height, multiplier: 0.25, constant: -10)
        
        let widthConstraintForBlackViewTwo = NSLayoutConstraint(item: blackViewTwo, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewTwo = NSLayoutConstraint(item: blackViewTwo, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
//        let widthConstraintForBlackViewThree = NSLayoutConstraint(item: blackViewThree, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewThree = NSLayoutConstraint(item: blackViewThree, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewFour = NSLayoutConstraint(item: blackViewFour, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewFour = NSLayoutConstraint(item: blackViewFour, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewFive = NSLayoutConstraint(item: blackViewFive, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewFive = NSLayoutConstraint(item: blackViewFive, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
//        let widthConstraintForBlackViewSix = NSLayoutConstraint(item: blackViewSix, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewSix = NSLayoutConstraint(item: blackViewSix, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewSeven = NSLayoutConstraint(item: blackViewSeven, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewSeven = NSLayoutConstraint(item: blackViewSeven, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewEight = NSLayoutConstraint(item: blackViewEight, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewEight = NSLayoutConstraint(item: blackViewEight, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
//        let widthConstraintForBlackViewNine = NSLayoutConstraint(item: blackViewNine, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
        let heightConstrainForBlackViewNine = NSLayoutConstraint(item: blackViewNine, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewTen = NSLayoutConstraint(item: blackViewTen, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
//        let heightConstrainForBlackViewTen = NSLayoutConstraint(item: blackViewTen, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        let widthConstraintForBlackViewEleven = NSLayoutConstraint(item: blackViewEleven, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
//        let heightConstrainForBlackViewEleven = NSLayoutConstraint(item: blackViewEleven, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
//        let widthConstraintForBlackViewTwelve = NSLayoutConstraint(item: blackViewTwelve, attribute: .width, relatedBy: .equal, toItem: blackViewOne, attribute: .width, multiplier: 1, constant: 0)
//        let heightConstrainForBlackViewTwelve = NSLayoutConstraint(item: blackViewTwelve, attribute: .height, relatedBy: .equal, toItem: blackViewOne, attribute: .height, multiplier: 1, constant: 0)
        
        bottomView.addConstraints([widthConstraintForBlackViewOne, heightConstrainForBlackViewOne, widthConstraintForBlackViewTwo, heightConstrainForBlackViewTwo, widthConstraintForBlackViewFour, heightConstrainForBlackViewFour, widthConstraintForBlackViewFive, heightConstrainForBlackViewFive, widthConstraintForBlackViewSeven, heightConstrainForBlackViewSeven, widthConstraintForBlackViewEight, heightConstrainForBlackViewEight, heightConstrainForBlackViewThree, heightConstrainForBlackViewSix, heightConstrainForBlackViewNine, widthConstraintForBlackViewTen, widthConstraintForBlackViewEleven])
        
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-[v1]-8-[v2]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewOne, "v1": blackViewTwo, "v2": blackViewThree]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-[v1]-8-[v2]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewFour, "v1": blackViewFive, "v2": blackViewSix]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-[v1]-8-[v2]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewSeven, "v1": blackViewEight, "v2": blackViewNine]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-[v1]-8-[v2]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewTen, "v1": blackViewEleven, "v2": blackViewTwelve]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-[v1]-8-[v2]-8-[v3]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewOne, "v1": blackViewFour, "v2": blackViewSeven, "v3": blackViewTen]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-[v1]-8-[v2]-8-[v3]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewTwo, "v1": blackViewFive, "v2": blackViewEight, "v3": blackViewEleven]))
        bottomView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-[v1]-8-[v2]-8-[v3]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": blackViewThree, "v1": blackViewSix, "v2": blackViewNine, "v3": blackViewTwelve]))
        
        
        
        
    }
}
