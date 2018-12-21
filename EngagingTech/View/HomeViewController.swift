//
//  ViewController.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 03/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

     var getData = ContactsAPI()
    
     var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
       
       hideActivity()
        
    }
    
    @objc func buttonPressed(){
          displayActivity()
        getData.getContaxtsData { [weak self]  (json) in
            guard let json = json else {
             
                let contactDetailsController = ContactDetailsController()

                self?.present( contactDetailsController, animated: true)
                return }
                print("This is the contact\(json)")
                self?.transition(contact: json)
            
        }
    }

    func transition(contact: Contact) {
        self.contact = contact
            let contactDetailsController = ContactDetailsController()
            contactDetailsController.cpnt = contact
            self.present( contactDetailsController, animated: true)
       
        }
    
    var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap me", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setBackgroundImage(#imageLiteral(resourceName: "ButtonPressed"), for: .normal)
        button.setTitleColor(.white, for: .normal)

        return button
    }()

    var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .gray)
         ai.translatesAutoresizingMaskIntoConstraints = false
        ai.transform = CGAffineTransform(scaleX: 2, y: 2)
        return ai
    }()
    
    var activityLabel: UILabel = {
        let al = UILabel()
         al.translatesAutoresizingMaskIntoConstraints = false
        al.text = "Please wait.."
        al.textAlignment = .center
        al.font = UIFont.italicSystemFont(ofSize: 20)
        return al
    }()
    
    func hideActivity() {
        button.isHidden = false
        activityLabel.isHidden = true
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    
    func displayActivity() {
        button.isHidden = true
        activityLabel.isHidden = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
    }
    func setupUI() {
        view.addSubview(button)
        view.addSubview(activityIndicator)
        view.addSubview(activityLabel)
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant:200).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant:200).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 0).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityLabel.widthAnchor.constraint(equalToConstant:200).isActive = true
        activityLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 0).isActive = true
         activityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}

