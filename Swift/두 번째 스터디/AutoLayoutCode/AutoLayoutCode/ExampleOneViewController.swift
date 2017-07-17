//
//  ExampleOneViewController.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 13/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ExampleOneViewController: UIViewController
class ExampleOneViewController: UIViewController {

    // MARK: Properties
        // Header
    weak var headerView: UIView?
    weak var buttonOne: CustomButton?
    weak var buttonTwo: CustomButton?
    weak var titleLabel: CustomLabel?
    
        // Body 1
    weak var bodyViewOne: UIView?
    weak var greenView: CustomView?
    weak var redView: CustomView?
    weak var bodyViewOneLabel: CustomLabel?
    
        // Body 2
    weak var bodyViewTwo: UIView?
    weak var smallView: CustomView?
    weak var multiplierContainerView: UIView?
    weak var multiplierLabelOne: CustomLabel?
    weak var multiplierLabelTwo: CustomLabel?
    
        // Body 3
    weak var bodyViewThree: UIView?
    weak var equalHeightLabelOne: CustomLabel?
    weak var equalHeightLabelTwo: CustomLabel?
    weak var equalHeightLabelThree: CustomLabel?
    
        // Footer
    weak var footerView: UIView?
    weak var blueView: CustomView?
    weak var footerLabel: CustomLabel?
    
        // test
    let textLabel: UILabel = {
        let label = UILabel()
        //        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "찾는 중"
        
        return label
    }()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setViews()
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    // MARK: SetViews()
    func setViews() {
        navigationItem.title = "Example_01"
        view.backgroundColor = .white
        // MARK: set header
        let hView = UIView()
        let btnOne = CustomButton(bgColor: UIColor(hexString: "#559FF7"), width: 44, title: "너비 44")
        let btnTwo = CustomButton(bgColor: UIColor(hexString: "#559FF7"), width: 44, title: "버튼")
        let titlelbl = CustomLabel(bgColor: UIColor(hexString: "#686868"), txt: "이곳은 타이틀입니다.")
        hView.translatesAutoresizingMaskIntoConstraints = false
        btnOne.translatesAutoresizingMaskIntoConstraints = false
        btnTwo.translatesAutoresizingMaskIntoConstraints = false
        titlelbl.translatesAutoresizingMaskIntoConstraints = false
        
        headerView = hView
        headerView?.backgroundColor = .white
        buttonOne = btnOne
        buttonTwo = btnTwo
        titleLabel = titlelbl
        
        guard let headerView = headerView, let buttonOne = buttonOne, let buttonTwo = buttonTwo, let titleLabel = titleLabel else {
            print("Error: setView -> header")
            return
        }
        
        view.addSubview(headerView)
        headerView.addSubview(buttonOne)
        headerView.addSubview(buttonTwo)
        headerView.addSubview(titleLabel)
        
            // headerView
        let heightConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let yConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        /*
        let leadingConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([heightConstraintForHeaderView, yConstraintForHeaderView, leadingConstraintForHeaderView,trailingConstraintForHeaderView])
         
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        */
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        
            // buttonOne
        let widthConstraintForBtnOne = NSLayoutConstraint(item: buttonOne, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonOne]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonOne]))
        
            // buttonTwo
        let widthConstraintForBtnTwo = NSLayoutConstraint(item: buttonTwo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 44)
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonTwo]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonTwo]))
        
            // titleLabel
        let leadingConstraintForTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: buttonOne, attribute: .trailing, multiplier: 1, constant: 0)
        let trailingConstraintForTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: buttonTwo, attribute: .leading, multiplier: 1, constant: 0)
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleLabel]))
        
        headerView.addConstraints([widthConstraintForBtnOne, widthConstraintForBtnTwo, leadingConstraintForTitleLabel, trailingConstraintForTitleLabel])
        
        // MARK: set body 1
        let bViewOne = UIView()
        let gView = CustomView(bgColor: UIColor(hexString: "#2CD23B"), height: 100)
        let rView = CustomView(bgColor: UIColor(hexString: "#F5292A"), height: 100)
        let bOneLabel = CustomLabel(txt: "둘은 같은 항상 같은 너비를 가지고 있고, 높이는 100 이다")
        bViewOne.translatesAutoresizingMaskIntoConstraints = false
        gView.translatesAutoresizingMaskIntoConstraints = false
        rView.translatesAutoresizingMaskIntoConstraints = false
        bOneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewOne = bViewOne
        bodyViewOne?.backgroundColor = .white
        greenView = gView
        redView = rView
        bodyViewOneLabel = bOneLabel
        
        guard let bodyViewOne = bodyViewOne, let greenView = greenView, let redView = redView, let bodyViewOneLabel = bodyViewOneLabel else {
            print("Error: setView -> body 1")
            return
        }
        
        view.addSubview(bodyViewOne)
        bodyViewOne.addSubview(greenView)
        bodyViewOne.addSubview(redView)
        bodyViewOne.addSubview(bodyViewOneLabel)
        
            // bodyViewOne
        let topConstraintForBodyViewOne = NSLayoutConstraint(item: bodyViewOne, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForBodyViewOne = NSLayoutConstraint(item: bodyViewOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewOne]))
        
            // greenView
        let leadingConstraintForGreenView = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: bodyViewOne, attribute: .leading, multiplier: 1, constant: 0)
        let widthConstraintForGreenView = NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: bodyViewOne, attribute: .width, multiplier: 0.5, constant: 0)
        bodyViewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": greenView]))
        
            // redView
        let trailingConstraintForRedView = NSLayoutConstraint(item: redView, attribute: .trailing, relatedBy: .equal, toItem: bodyViewOne, attribute: .trailing, multiplier: 1, constant: 0)
        let widthConstraintForRedView = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: greenView, attribute: .width, multiplier: 1, constant: 0)
        bodyViewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": redView]))
        
            // bodyViewOneLabel
        bodyViewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewOneLabel]))
        bodyViewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewOneLabel]))
        
        bodyViewOne.addConstraints([leadingConstraintForGreenView, widthConstraintForGreenView, trailingConstraintForRedView, widthConstraintForRedView])
        
        // MARK: set body 2
        let bViewTwo = UIView()
        let sView = CustomView(bgColor: UIColor(hexString: "#1F70E0"))
        let mCView = UIView()
        let mlblOne = CustomLabel(bgColor: UIColor(hexString: "#E33E92"), txtAlignment: .left, txt: "버전 (라벨의 비율 6 : ")
        let mlblTwo = CustomLabel(bgColor: UIColor(hexString: "#F8DE46"), txtAlignment: .right, txt: "4) Week_02")
        bViewTwo.translatesAutoresizingMaskIntoConstraints = false
        sView.translatesAutoresizingMaskIntoConstraints = false
        mCView.translatesAutoresizingMaskIntoConstraints = false
        mlblOne.translatesAutoresizingMaskIntoConstraints = false
        mlblTwo.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewTwo = bViewTwo
        bodyViewTwo?.backgroundColor = UIColor(hexString: "#2A4A57")
        smallView = sView
        multiplierContainerView = mCView
        multiplierContainerView?.backgroundColor = .white
        multiplierLabelOne = mlblOne
        multiplierLabelTwo = mlblTwo
        
        guard let bodyViewTwo = bodyViewTwo, let smallView = smallView, let multiplierContainerView = multiplierContainerView, let multiplierLabelOne = multiplierLabelOne, let multiplierLabelTwo = multiplierLabelTwo else {
            print("Error: setView -> body 2")
            return
        }
        
        view.addSubview(bodyViewTwo)
        bodyViewTwo.addSubview(smallView)
        bodyViewTwo.addSubview(multiplierContainerView)
        multiplierContainerView.addSubview(multiplierLabelOne)
        multiplierContainerView.addSubview(multiplierLabelTwo)
        
            // bodyViewTwo
        let topConstraintForBodyViewTwo = NSLayoutConstraint(item: bodyViewTwo, attribute: .top, relatedBy: .equal, toItem: bodyViewOne, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForBodyViewTwo = NSLayoutConstraint(item: bodyViewTwo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewTwo]))
        
            // smallView, multiplierContainerView
        let widthConstraintForSmallView = NSLayoutConstraint(item: smallView, attribute: .width, relatedBy: .equal, toItem: smallView, attribute: .height, multiplier: 1, constant: 0)
//        let leadingConstraintForSmallView = NSLayoutConstraint(item: smallView, attribute: .leading, relatedBy: .equal, toItem: bodyViewTwo, attribute: .leading, multiplier: 1, constant: 12)
        bodyViewTwo.addConstraint(widthConstraintForSmallView)
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]-12-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": smallView]))
        
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0]-12-[v1]-12-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": smallView, "v1": multiplierContainerView]))
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": multiplierContainerView]))
        
            // multiplierLabelOne
        let leadingConstraintForMultiplierLabelOne = NSLayoutConstraint(item: multiplierLabelOne, attribute: .leading, relatedBy: .equal, toItem: multiplierContainerView, attribute: .leading, multiplier: 1, constant: 0)
        let widthConstraintForMultiplierLabelOne = NSLayoutConstraint(item: multiplierLabelOne, attribute: .width, relatedBy: .equal, toItem: multiplierContainerView, attribute: .width, multiplier: 0.6, constant: 0)
        multiplierContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": multiplierLabelOne]))
        
            // multiplierLabelTwo
        let trailingConstraintForMultiplierLabelTwo = NSLayoutConstraint(item: multiplierLabelTwo, attribute: .trailing, relatedBy: .equal, toItem: multiplierContainerView, attribute: .trailing, multiplier: 1, constant: 0)
        let widthConstraintForMultiplierLabelTwo = NSLayoutConstraint(item: multiplierLabelTwo, attribute: .width, relatedBy: .equal, toItem: multiplierContainerView, attribute: .width, multiplier: 0.4, constant: 0)
        multiplierContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": multiplierLabelTwo]))
        
        multiplierContainerView.addConstraints([leadingConstraintForMultiplierLabelOne, widthConstraintForMultiplierLabelOne, trailingConstraintForMultiplierLabelTwo, widthConstraintForMultiplierLabelTwo])
        
        
        // MARK: set footer
        let fView = UIView()
        let flbl = CustomLabel(txtAlignment: .left, txt: "글자수가 변해도 가운데 정렬, \n이 뷰는 항상 아래에 고정되어 있다.")
        let bView = CustomView(bgColor: UIColor(hexString: "#1F70E0"))
        fView.translatesAutoresizingMaskIntoConstraints = false
        flbl.translatesAutoresizingMaskIntoConstraints = false
        bView.translatesAutoresizingMaskIntoConstraints = false
        
        footerView = fView
        footerView?.backgroundColor = UIColor(hexString: "#646464")
        footerLabel = flbl
        footerLabel?.numberOfLines = 2
        blueView = bView
        
        guard let footerView = footerView, let footerLabel = footerLabel, let blueView = blueView else {
            print("Error: setView -> footer")
            return
        }
        
        view.addSubview(footerView)
        footerView.addSubview(footerLabel)
        footerView.addSubview(blueView)
        
            // footerView
        let bottomConstraintForFooterView = NSLayoutConstraint(item: footerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForFooterView = NSLayoutConstraint(item: footerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": footerView]))
        
            // footerLabel
        let centerXConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .centerX, relatedBy: .equal, toItem: footerView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .centerY, relatedBy: .equal, toItem: footerView, attribute: .centerY, multiplier: 1, constant: 0)
        /*
         
        let topConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: footerView, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: footerView, attribute: .bottom, multiplier: 1, constant: 0)
        centerXConstraintForFooterLabel.priority = 1000
        centerYConstraintForFooterLabel.priority = 1000
        topConstraintForFooterLabel.priority = 888
        bottomConstraintForFooterLabel.priority = 888
        
        */
        
            // blueView
        let centerYConstraintForBlueView = NSLayoutConstraint(item: blueView, attribute: .centerY, relatedBy: .equal, toItem: footerView, attribute: .centerY, multiplier: 1, constant: 0)
        let heightConstraintForBlueView = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: footerLabel, attribute: .height, multiplier: 1, constant: 0)
        let widthConstraintForBlueView = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: blueView, attribute: .height, multiplier: 1, constant: 0)
        let trailingConstraintForBlueView = NSLayoutConstraint(item: blueView, attribute: .trailing, relatedBy: .equal, toItem: footerLabel, attribute: .leading, multiplier: 1, constant: -8)
        
        footerView.addConstraints([centerXConstraintForFooterLabel, centerYConstraintForFooterLabel, centerYConstraintForBlueView, heightConstraintForBlueView, widthConstraintForBlueView, trailingConstraintForBlueView])
        
        
        // MARK: set body 3
        let bViewThree = UIView()
        let eHeightlblOne = CustomLabel(txtColor: .black, txt: "세개의 라벨은 같은 높이를 갖고 회전이 되었을 때엔")
        let eHeightlblTwo = CustomLabel(txtColor: .black, txt: "남은 흰색 뷰 크기만을 사용하여 보여준다")
        let eHeightlblThree = CustomLabel(txtColor: .black, txt: "무슨말이지..")
        bViewThree.translatesAutoresizingMaskIntoConstraints = false
        eHeightlblOne.translatesAutoresizingMaskIntoConstraints = false
        eHeightlblTwo.translatesAutoresizingMaskIntoConstraints = false
        eHeightlblThree.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewThree = bViewThree
        bodyViewThree?.backgroundColor = .white
        equalHeightLabelOne = eHeightlblOne
        equalHeightLabelTwo = eHeightlblTwo
        equalHeightLabelThree = eHeightlblThree
        
        guard let bodyViewThree = bodyViewThree, let equalHeightLabelOne = equalHeightLabelOne, let equalHeightLabelTwo = equalHeightLabelTwo, let equalHeightLabelThree = equalHeightLabelThree else {
            print("Error: setView -> body 3")
            return
        }
        
        view.addSubview(bodyViewThree)
        bodyViewThree.addSubview(equalHeightLabelOne)
        bodyViewThree.addSubview(equalHeightLabelTwo)
        bodyViewThree.addSubview(equalHeightLabelThree)
        
            // bodyViewThree
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewThree]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1][v2]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewTwo, "v1": bodyViewThree, "v2": footerView]))
        
            // equalHeightLabelOne
        let topConstraintForequalHeightLabelOne = NSLayoutConstraint(item: equalHeightLabelOne, attribute: .top, relatedBy: .equal, toItem: bodyViewThree, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraintForequalHeightLabelOne = NSLayoutConstraint(item: equalHeightLabelOne, attribute: .height, relatedBy: .equal, toItem: bodyViewThree, attribute: .height, multiplier: 0.33333, constant: 0)
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": equalHeightLabelOne]))
        
            // equalHeightLabelTwo
        let topConstraintForequalHeightLabelTwo = NSLayoutConstraint(item: equalHeightLabelTwo, attribute: .top, relatedBy: .equal, toItem: equalHeightLabelOne, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForequalHeightLabelTwo = NSLayoutConstraint(item: equalHeightLabelTwo, attribute: .height, relatedBy: .equal, toItem: equalHeightLabelOne, attribute: .height, multiplier: 1, constant: 0)
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": equalHeightLabelTwo]))
        
            // equalHeightLabelThree
        let bottomConstraintForequalHeightLabelThree = NSLayoutConstraint(item: equalHeightLabelThree, attribute: .bottom, relatedBy: .equal, toItem: bodyViewThree, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForequalHeightLabelThree = NSLayoutConstraint(item: equalHeightLabelThree, attribute: .height, relatedBy: .equal, toItem: equalHeightLabelTwo, attribute: .height, multiplier: 1, constant: 0)
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": equalHeightLabelThree]))
        
        bodyViewThree.addConstraints([topConstraintForequalHeightLabelOne, heightConstraintForequalHeightLabelOne, topConstraintForequalHeightLabelTwo, heightConstraintForequalHeightLabelTwo, bottomConstraintForequalHeightLabelThree, heightConstraintForequalHeightLabelThree])
        
        view.addConstraints([heightConstraintForHeaderView, yConstraintForHeaderView, topConstraintForBodyViewOne, heightConstraintForBodyViewOne, topConstraintForBodyViewTwo, heightConstraintForBodyViewTwo, bottomConstraintForFooterView, heightConstraintForFooterView]) // 0
        /*
 
        print("before : testView")
        let testView = CustomView()
        print("after : testView")
        testView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView = testView
        print("after : headerView")
        headerView?.backgroundColor = .white
        guard let headerView = headerView else {
            print("Error: serViews()")
            return
        }
        
        view.addSubview(headerView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-20-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        
        */
    }
}
