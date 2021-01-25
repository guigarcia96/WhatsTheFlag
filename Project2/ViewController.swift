//
//  ViewController.swift
//  Project2
//
//  Created by Guilherme Moraes on 22/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    var safeArea: UILayoutGuide!
    
    var score = 0
    var correctAnswer = 0
    var totalTentatives = 1
    var countries = [String]()
        
    var flagButton1 = Components().flagButton1
    var flagButton2 = Components().flagButton2
    var flagButton3 = Components().flagButton3
    var countryTitle = Components().countryTitle

    var countriesViewModel = CountriesViewModel(title: "", score: 0, totalTentatives: 0, correctAnswer: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        navigationItem.setTitle(title: "Guilherme", subtitle: "Score: \(countriesViewModel.score)" )
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
    
    
    //metodo é chamado tanto no começo, tanto quando a alert view é finalizada, por isso isso o UIAlerctAcion como padrão para nil para que seja usado sem problemas no viewdidload
    func askQuestion(action: UIAlertAction! = nil) {
        
        let countries = countriesViewModel.getCountriesName()
        let asnwer = countriesViewModel.getCorrectAnswerPath()
        countryTitle.text = countries[asnwer]
        navigationItem.setTitle(title: "Guilherme", subtitle: "Score: \(countriesViewModel.score)" )
        
        flagButton1.setImage(UIImage(named: countriesViewModel.getCountriesName()[0]), for: .normal)
        flagButton2.setImage(UIImage(named: countriesViewModel.getCountriesName()[1]), for: .normal)
        flagButton3.setImage(UIImage(named: countriesViewModel.getCountriesName()[2]), for: .normal)
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
        
        countriesViewModel.getCorrectAnswer(senderValue: sender.tag)
        
        if(countriesViewModel.totalTentatives == 10) {
            let ac = UIAlertController(title: countriesViewModel.title, message: "Your final score is: \(countriesViewModel.score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try Again", style: .default, handler: askQuestion))
            score = 0
            totalTentatives = 0
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: countriesViewModel.title, message: "Your score is \(countriesViewModel.score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        
        
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

