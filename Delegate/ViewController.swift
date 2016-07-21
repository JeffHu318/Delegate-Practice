//
//  ViewController.swift
//  Delegate
//
//  Created by WEI on 7/21/16.
//  Copyright © 2016 WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var insertFiled: UITextField!
    @IBOutlet weak var LabelCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        insertFiled.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location >= 10 {
            
            LabelCount.text = "你已經輸入超過10個字摟)"
            return false
        }
        else
        {
            if(string == "")
            {
                LabelCount.text = "你已經輸入了\(range.location)個字摟)"
            }
            else
            {
                LabelCount.text = "你已經輸入了\(range.location+1)個字摟)"
            }
            
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        return textField.resignFirstResponder()
    }
}

