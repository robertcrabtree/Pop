//
//  ViewController.swift
//  Pop
//
//  Created by Rob Crabtree on 11/13/17.
//  Copyright © 2017 Rob Crabtree. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!

    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let tapper = UITapGestureRecognizer()
        tapper.addTarget(self, action: #selector(viewTapped(sender:)))
        return tapper
    }()

    @IBAction func sayIt(_ sender: UIButton) {
        guard let text = textField.text, text.count > 0 else { return }
        showOkAlert(title: "You said", message: text, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addGestureRecognizer(tapGestureRecognizer)
        textField.delegate = self
    }
    
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
