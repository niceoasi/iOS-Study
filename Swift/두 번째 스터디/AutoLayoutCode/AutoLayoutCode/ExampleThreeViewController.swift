//
//  ExampleThreeViewController.swift
//  AutoLayoutCode
//
//  Created by Daeyun Ethan Kim on 13/07/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ExampleThreeViewController: UIViewController
class ExampleThreeViewController: UIViewController {

    // MARK: Properties
        // header
    weak var headerView: UIView?
    weak var titleText: CustomLabel?
    
        // body 1
    weak var bodyViewOne: UIView?
    weak var logoImageLabel: CustomLabel?
    
        // body 2
    weak var bodyViewTwo: UIView?
    weak var accountLabel: CustomLabel?
    weak var accountTextField: UITextField?
    
        // body 3
    weak var bodyViewThree: UIView?
    weak var passwordLabel: CustomLabel?
    weak var passwordTextField: UITextField?
    
        // body 4
    weak var bodyViewFour: UIView?
    weak var findPasswordButton: CustomButton?
    weak var buttonContainerView: UIView?
    weak var loginButton: CustomButton?
    weak var joinButton: CustomButton?
    
        // footer
    weak var footerView: UIView?
    weak var footerLabel: CustomLabel?
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: SetViews()
    func setViews() {
        navigationItem.title = "Example_03"
        view.backgroundColor = .white
        // MARK: set header
        let hView = UIView()
        let tText = CustomLabel(txt: "타이틀 뷰 입니다.")
        hView.translatesAutoresizingMaskIntoConstraints = false
        tText.translatesAutoresizingMaskIntoConstraints = false
        
        headerView = hView
        headerView?.backgroundColor = UIColor(hexString: "#686868")
        titleText = tText
        
        guard let headerView = headerView, let titleText = titleText else {
            print("Error: setViews() -> set header")
            return
        }
        
        view.addSubview(headerView)
        headerView.addSubview(titleText)

            // headerView
        let topConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForHeaderView = NSLayoutConstraint(item: headerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([topConstraintForHeaderView, heightConstraintForHeaderView])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerView]))
        
            // titleText
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleText]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": titleText]))
        
        
        // MARK: set body 1
        let bViewOne = UIView()
        let lilbl = CustomLabel(bgColor:UIColor(hexString: "#1F70E0") , txt: "로고 이미지")
        bViewOne.translatesAutoresizingMaskIntoConstraints = false
        lilbl.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewOne = bViewOne
        bodyViewOne?.backgroundColor = .white
        logoImageLabel = lilbl
        
        guard let bodyViewOne = bodyViewOne, let logoImageLabel = logoImageLabel else {
            print("Error: setViews() -> set body 1")
            return
        }
        
        view.addSubview(bodyViewOne)
        bodyViewOne.addSubview(logoImageLabel)
        
            // bodyViewOne
        let topConstraintForBodyViewOne = NSLayoutConstraint(item: bodyViewOne, attribute: .top, relatedBy: .equal, toItem: headerView, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForBodyViewOne = NSLayoutConstraint(item: bodyViewOne, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
        view.addConstraints([topConstraintForBodyViewOne, heightConstraintForBodyViewOne])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewOne]))
        
            // logoImageLabel
        let centerXConstraintForLogoImageLabel = NSLayoutConstraint(item: logoImageLabel, attribute: .centerX, relatedBy: .equal, toItem: bodyViewOne, attribute: .centerX, multiplier: 1, constant: 0)
        let widthConstraintForLogoImageLabel = NSLayoutConstraint(item: logoImageLabel, attribute: .width, relatedBy: .equal, toItem: logoImageLabel, attribute: .height, multiplier: 1, constant: 0)
        bodyViewOne.addConstraints([centerXConstraintForLogoImageLabel, widthConstraintForLogoImageLabel])
        bodyViewOne.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": logoImageLabel]))
        
        
        // MARK: set body 2
        let bViewTwo = UIView()
        let albl = CustomLabel(txtColor: .black, txtAlignment: .left, txt: "Account")
        let aTxtField = UITextField()
        bViewTwo.translatesAutoresizingMaskIntoConstraints = false
        albl.translatesAutoresizingMaskIntoConstraints = false
        aTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewTwo = bViewTwo
        bodyViewTwo?.backgroundColor = UIColor(hexString: "#F8DE46")
        accountLabel = albl
        accountTextField = aTxtField
        accountTextField?.backgroundColor = .clear
        accountTextField?.placeholder = "계정을 입력해주세요."
        
        guard let bodyViewTwo = bodyViewTwo, let accountLabel = accountLabel, let accountTextField = accountTextField else {
            print("Error: setViews() -> set body 2")
            return
        }
        
        view.addSubview(bodyViewTwo)
        bodyViewTwo.addSubview(accountLabel)
        bodyViewTwo.addSubview(accountTextField)
        
            // bodyViewTwo
        let topConstraintForBodyViewTwo = NSLayoutConstraint(item: bodyViewTwo, attribute: .top, relatedBy: .equal, toItem: bodyViewOne, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForBodyViewTwo = NSLayoutConstraint(item: bodyViewTwo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([topConstraintForBodyViewTwo, heightConstraintForBodyViewTwo])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewTwo]))
        
            // accountTextField
//        let trailingConstraintForAccountTextField = NSLayoutConstraint(item: accountTextField, attribute: .trailing, relatedBy: .equal, toItem: bodyViewTwo, attribute: .trailing, multiplier: 1, constant: 0)
        let widthConstraintForAccountTextField = NSLayoutConstraint(item: accountTextField, attribute: .width, relatedBy: .equal, toItem: bodyViewTwo, attribute: .width, multiplier: 0.7, constant: 0)
        bodyViewTwo.addConstraint(widthConstraintForAccountTextField)
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": accountTextField]))
        
            // accountLabel
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": accountLabel, "v1": accountTextField]))
        bodyViewTwo.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": accountLabel]))
        
        
        // MARK: set body 3
        let bViewThree = UIView()
        let plbl = CustomLabel(txtColor: .black, txtAlignment: .left, txt: "Password")
        let pTxtField = UITextField()
        bViewThree.translatesAutoresizingMaskIntoConstraints = false
        plbl.translatesAutoresizingMaskIntoConstraints = false
        pTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewThree = bViewThree
        bodyViewThree?.backgroundColor = UIColor(hexString: "#E33E92")
        passwordLabel = plbl
        passwordTextField = pTxtField
        passwordTextField?.backgroundColor = .clear
        passwordTextField?.placeholder = "비밀번호를 입력해주세요."
        
        guard let bodyViewThree = bodyViewThree, let passwordLabel = passwordLabel, let passwordTextField = passwordTextField else {
            print("Error: setViews() -> set body 3")
            return
        }
        
        view.addSubview(bodyViewThree)
        bodyViewThree.addSubview(passwordLabel)
        bodyViewThree.addSubview(passwordTextField)
        
            // bodyViewThree
        let topConstraintForBodyViewThree = NSLayoutConstraint(item: bodyViewThree, attribute: .top, relatedBy: .equal, toItem: bodyViewTwo, attribute: .bottom, multiplier: 1, constant: 0)
        let heightConstraintForBodyViewThree = NSLayoutConstraint(item: bodyViewThree, attribute: .height, relatedBy: .equal, toItem: nil,  attribute: .notAnAttribute, multiplier: 1, constant: 50)
        view.addConstraints([topConstraintForBodyViewThree, heightConstraintForBodyViewThree])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewThree]))

            // passwordTextField
        let widthConstraintForPasswordTextField = NSLayoutConstraint(item: passwordTextField, attribute: .width, relatedBy: .equal, toItem: bodyViewThree, attribute: .width, multiplier: 0.7, constant: 0)
        bodyViewThree.addConstraint(widthConstraintForPasswordTextField)
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": passwordTextField]))

            // passwordLabel
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0][v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": passwordLabel, "v1": passwordTextField]))
        bodyViewThree.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": passwordLabel]))
        
        
        // MARK: set footer
        let fView = UIView()
        let flbl = CustomLabel(txtColor: .black, txt: "Copyright @ Genetory")
        fView.translatesAutoresizingMaskIntoConstraints = false
        flbl.translatesAutoresizingMaskIntoConstraints = false
        
        footerView = fView
        footerView?.backgroundColor = .white
        footerLabel = flbl
        
        guard let footerView = footerView, let footerLabel = footerLabel else {
            print("Error: setViews() -> set footer")
            return
        }
        
        view.addSubview(footerView)
        footerView.addSubview(footerLabel)
        
            // footerView
        let bottomConstraintForFooterView = NSLayoutConstraint(item: footerView, attribute: .bottom, relatedBy: .equal, toItem: bottomLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let heightConstraintForFooterView = NSLayoutConstraint(item: footerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        view.addConstraints([bottomConstraintForFooterView, heightConstraintForFooterView])
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": footerView]))
        
            // footerLabel
        let centerXConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .centerX, relatedBy: .equal, toItem: footerView, attribute: .centerX, multiplier: 1, constant: 0)
        let topConstraintForFooterLabel = NSLayoutConstraint(item: footerLabel, attribute: .top, relatedBy: .equal, toItem: footerView, attribute: .top, multiplier: 1, constant: 0)
        footerView.addConstraints([centerXConstraintForFooterLabel, topConstraintForFooterLabel])
        
        
        // MARK: set body 4
        let bViewFour = UIView()
        let fpButton = CustomButton(bgColor: UIColor(hexString: "#F5292A"), titleColor: UIColor(hexString: "#765F61"), title: "비밀번호를 잊어버리셨나요?")
        let bContrainerView = UIView()
        let lButton = CustomButton(bgColor: UIColor(hexString: "#F8DE46"), title: "로그인하기")
        let jButton = CustomButton(bgColor: UIColor(hexString: "#559FF7"), title: "회원가입하기")
        bViewFour.translatesAutoresizingMaskIntoConstraints = false
        fpButton.translatesAutoresizingMaskIntoConstraints = false
        bContrainerView.translatesAutoresizingMaskIntoConstraints = false
        lButton.translatesAutoresizingMaskIntoConstraints = false
        jButton.translatesAutoresizingMaskIntoConstraints = false
        
        bodyViewFour = bViewFour
        bodyViewFour?.backgroundColor = .white
        findPasswordButton = fpButton
        buttonContainerView = bContrainerView
        buttonContainerView?.backgroundColor = .white
        loginButton = lButton
        joinButton = jButton
        
        guard let bodyViewFour = bodyViewFour, let findPasswordButton = findPasswordButton, let buttonContainerView = buttonContainerView, let  loginButton = loginButton, let joinButton = joinButton else {
            print("Error: setViews() -> set body 4")
            return
        }
        
        view.addSubview(bodyViewFour)
        bodyViewFour.addSubview(findPasswordButton)
        bodyViewFour.addSubview(buttonContainerView)
        buttonContainerView.addSubview(loginButton)
        buttonContainerView.addSubview(joinButton)
        
            // bodyViewFour
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewFour]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0][v1][v2]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": bodyViewThree, "v1": bodyViewFour, "v2": footerView]))
        
            // findPasswordButton
        let topConstraintForFindPasswordButton = NSLayoutConstraint(item: findPasswordButton, attribute: .top, relatedBy: .equal, toItem: bodyViewFour, attribute: .top, multiplier: 1, constant: 0)
        let trailingConstraintForFindPasswordButton = NSLayoutConstraint(item: findPasswordButton, attribute: .trailing, relatedBy: .equal, toItem: bodyViewFour, attribute: .trailing, multiplier: 1, constant: -16)
        bodyViewFour.addConstraints([topConstraintForFindPasswordButton, trailingConstraintForFindPasswordButton])
        
            // buttonContainerView
        let centerXConstraintForButtonContainerView = NSLayoutConstraint(item: buttonContainerView, attribute: .centerX, relatedBy: .equal, toItem: bodyViewFour, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraintForButtonContainerView = NSLayoutConstraint(item: buttonContainerView, attribute: .centerY, relatedBy: .equal, toItem: bodyViewFour, attribute: .centerY, multiplier: 1, constant: 0)
        let widthConstraintForButtonContainerView = NSLayoutConstraint(item: buttonContainerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 240)
        let heightConstraintForButtonContainerView = NSLayoutConstraint(item: buttonContainerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        bodyViewFour.addConstraints([centerXConstraintForButtonContainerView, centerYConstraintForButtonContainerView, widthConstraintForButtonContainerView, heightConstraintForButtonContainerView])
        
            // loginButton, joinButton
        let widthConstraintForLoginButton = NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: buttonContainerView, attribute: .width, multiplier: 0.5, constant: -8)
        buttonContainerView.addConstraint(widthConstraintForLoginButton)
        buttonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": loginButton]))
        buttonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": joinButton]))
        buttonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]-16-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": loginButton, "v1": joinButton]))
        
    }

}
