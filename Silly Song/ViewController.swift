//
//  ViewController.swift
//  Silly Song
//
//  Created by Ravi Rathore on 12/23/15.
//  Copyright © 2015 Banago labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    var bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joinWithSeparator("\n")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    nameField.text?.removeAll()
    lyricsView.text.removeAll()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: UITextField) {
        nameField.text?.removeAll()
        lyricsView.text.removeAll()
        
    }
 
    @IBAction func displayLyrics(sender: UITextField) {
        
       print( lyricsView.text = lyricsForName(bananaFanaTemplate, fullName: nameField.text!) )
    }
    
    func shortNameFromName(name:String) -> String
    {
        let lowercaseName = name.lowercaseString
        let vowelSet = NSCharacterSet(charactersInString: "aeiou")
        if let firstVowelRange = lowercaseName.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: nil).rangeOfCharacterFromSet(vowelSet, options: .CaseInsensitiveSearch)
        {
            return lowercaseName.substringFromIndex(firstVowelRange.startIndex)
        }
        else
        {
            return lowercaseName
        }
        
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameFromName(fullName)
        
        let lyrics = lyricsTemplate
            .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: fullName)
            .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
        return lyrics
        
    }

}
// MARK: - UITextFieldDelegate
extension ViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

