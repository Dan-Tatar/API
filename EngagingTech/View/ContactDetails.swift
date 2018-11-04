//
//  ContactDetails.swift
//  EngagingTech
//
//  Created by Dan  Tatar on 04/11/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailsController: UIViewController {
    
    var cpnt: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        layoutSubviews()
        setContact(contactDetail: cpnt!)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        setProduct(productDetail: product)
//    }
    
    func setContact(contactDetail: Contact) {
//        nameLabel.text = contactDetail.name
        userNumberLabel.text = "\(contactDetail.userNumber)"
//        allNumbersLabel.text = String(contactDetail.allNumbers)

    }
    
    var userImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    var nameLabel: UILabel = {
        var nl = UILabel()
        nl.font = UIFont.boldSystemFont(ofSize: 21)
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.text = " Ms Smith"
        nl.textAlignment = .center
        return nl
    }()
    
    var userNumberLabel: UILabel = {
        var user = UILabel()
        user.font = UIFont.boldSystemFont(ofSize: 21)
        user.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        user.translatesAutoresizingMaskIntoConstraints = false
        user.text = "13454324"
        user.textAlignment = .center
        return user
    }()
    
    var telephonesLabel: UILabel = {
        var telephones = UILabel()
        telephones.font = UIFont.boldSystemFont(ofSize: 21)
        telephones.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        telephones.translatesAutoresizingMaskIntoConstraints = false
        telephones.text = "Telephones"
        telephones.textAlignment = .center
        return telephones
    }()
    
    var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    var detailsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var allNumbersLabel: UILabel = {
        var all = UILabel()
        all.translatesAutoresizingMaskIntoConstraints = false
        all.text = "Work: 020 444 2344"
        return all
    }()
    
    
    func layoutSubviews() {
        
        view.addSubview(userImage)
        view.addSubview(nameLabel)
        view.addSubview(userNumberLabel)
        view.addSubview(lineView)
        view.addSubview(detailsView)
        detailsView.addSubview(telephonesLabel)
        detailsView.addSubview(allNumbersLabel)
        
        // userImage constraints
        userImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 25).isActive = true
        userImage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor).isActive = true
        
        // nameLabel constraints
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor , constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // userNumberLabel constraints
        userNumberLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        userNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor , constant: 10).isActive = true
        userNumberLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        
        userNumberLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //lineView constraints
        lineView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        lineView.topAnchor.constraint(equalTo: userNumberLabel.bottomAnchor , constant: 16).isActive = true
        lineView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //detailView constraints
        detailsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        detailsView.topAnchor.constraint(equalTo: lineView.bottomAnchor , constant: 1).isActive = true
        detailsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -25).isActive = true
        detailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        
        //telephones constraints
        telephonesLabel.leftAnchor.constraint(equalTo: detailsView.leftAnchor, constant: 0).isActive = true
        telephonesLabel.topAnchor.constraint(equalTo: detailsView.topAnchor , constant: 16).isActive = true
        telephonesLabel.rightAnchor.constraint(equalTo: detailsView.rightAnchor, constant: 0).isActive = true
        telephonesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // allNumbers constraints
        allNumbersLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 25).isActive = true
        allNumbersLabel.topAnchor.constraint(equalTo: telephonesLabel.bottomAnchor , constant: 0).isActive = true
        allNumbersLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        allNumbersLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        
    }
}
