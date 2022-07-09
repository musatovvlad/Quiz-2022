//
//  WelcomeViewController.swift
//  Quiz 2022
//
//  Created by влад on 06.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(_segue: UIStoryboardSegue){
        print (#line, #function)
    }
}

