//
//  ViewController.swift
//  Project2
//
//  Created by Guilherme Moraes on 22/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalTentatives = 1
    
    var flagButton1 = Components().flagButton1
    var flagButton2 = Components().flagButton2
    var flagButton3 = Components().flagButton3
    var countryTitle = Components().countryTitle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        populateCountries()
        askQuestion()
        addingSubViews()
        setupConstraints()
        setupButtonsActions()
        
    }
    
    func setupButtonsActions() {
        flagButton1.addTarget(self, action:#selector(self.buttonTapped(sender:)), for: .touchUpInside)
        flagButton2.addTarget(self, action:#selector(self.buttonTapped(sender:)), for: .touchUpInside)
        flagButton3.addTarget(self, action:#selector(self.buttonTapped(sender:)), for: .touchUpInside)
    }
    
    func addingSubViews() {
        view.addSubview(countryTitle)
        view.addSubview(flagButton1)
        view.addSubview(flagButton2)
        view.addSubview(flagButton3)
        
    }
    
    func populateCountries() {
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    }
    
    //metodo é chamado tanto no começo, tanto quando a alert view é finalizada, por isso isso o UIAlerctAcion como padrão para nil para que seja usado sem problemas no viewdidload
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        countryTitle.text = countries[correctAnswer]
        navigationItem.setTitle(title: "Guilherme", subtitle: "Score: \(score)" )
        
        flagButton1.setImage(UIImage(named: countries[0]), for: .normal)
        flagButton2.setImage(UIImage(named: countries[1]), for: .normal)
        flagButton3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    func setupConstraints() {
        
        countryTitle.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40).isActive = true
        countryTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        flagButton1.topAnchor.constraint(equalTo: countryTitle.bottomAnchor, constant: 70).isActive = true
        flagButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagButton1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        flagButton1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        flagButton2.topAnchor.constraint(equalTo: flagButton1.bottomAnchor, constant: 60).isActive = true
        flagButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagButton2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        flagButton2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        flagButton3.topAnchor.constraint(equalTo: flagButton2.bottomAnchor, constant: 60).isActive = true
        flagButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        flagButton3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        flagButton3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    @objc func buttonTapped(sender: UIButton!) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, that's flag from \(countries[sender.tag])"
            score -= 1
        }
        
        if(totalTentatives == 10) {
            let ac = UIAlertController(title: title, message: "Your final score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try Again", style: .default, handler: askQuestion))
            score = 0
            totalTentatives = 0
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        totalTentatives += 1
        
    }
    
}

extension UINavigationItem {
    
    func setTitle(title:String, subtitle:String) {
        
        let one = UILabel()
        one.text = title
        one.font = UIFont.systemFont(ofSize: 19)
        one.sizeToFit()
        
        let two = UILabel()
        two.text = subtitle
        two.font = UIFont.systemFont(ofSize: 12)
        two.textAlignment = .center
        two.sizeToFit()
        
        let stackView = UIStackView(arrangedSubviews: [one, two])
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.alignment = .center
        
        let width = max(one.frame.size.width, two.frame.size.width)
        stackView.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        self.titleView = stackView
    }
}

