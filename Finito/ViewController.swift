//
//  ViewController.swift
//  Finito
//
//  Created by Matthew Li on 2017-12-08.
//  Copyright © 2017 Matthew Li. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func optionsClicked(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "Options", message: "Choose an option!", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Speak", style: .default, handler: { (action: UIAlertAction!) in
            let text = self.textField.text ?? ""
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            
            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Open", style: .default, handler: { (action: UIAlertAction!) in
            let text = self.textField.text ?? ""
            var textExtra = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            if (textExtra == nil) {
                textExtra = ""
            }
            let appUrl = URL(string: "Reciever://?" + textExtra!)
            UIApplication.shared.open(appUrl!, completionHandler: nil)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

