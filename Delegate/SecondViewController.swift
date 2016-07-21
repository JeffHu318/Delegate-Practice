//
//  SecondViewController.swift
//  Delegate
//
//  Created by WEI on 7/21/16.
//  Copyright © 2016 WEI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITextViewDelegate{

    @IBOutlet weak var CountLabel: UILabel!
    @IBOutlet weak var insertTextView: UITextView!
    
    var CountWord:Int = 0
    var switchLinePosition = Array<Int>()
    var lastlocation:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        insertTextView.delegate = self
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecondViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
            
        if(text == "") {
                
                var currentremoveIndex = -1
                for(index, element) in switchLinePosition.enumerated(){
                    
                    if(range.location == element)
                    {
                        //it mean remove \n
                        currentremoveIndex = index
                        break;
                    }
                }
                
                if currentremoveIndex != -1 {
                    switchLinePosition.remove(at: currentremoveIndex)
                }
                else{
                    
                    if range.location == 0 {
                        CountWord = 0
                    }
                    else {
                        
                        
                        CountWord = CountWord - 1
                        
                        //Still need handl delete many word at once
                    
                    }

                }
                
            }
            else if(text == "\n")
            {
                switchLinePosition.append(range.location)
            }
            else
            {
                //if range.location == (lastlocation + 1) {
                    //insert from next location
                    
                    CountWord = CountWord + text.characters.count
                //}
                //else {
                    
                    //handle hor inset many word in once
                //}
            }
        
            lastlocation = range.location
        
        if CountWord > 10 {
            CountWord = 10
            CountLabel.text = "你已經輸入超過10個字摟)"
            return false
        }
        else{
            
            CountLabel.text = "你已經輸入了\(CountWord)個字摟)"
            return true
        }
            
        

    }
    
}
