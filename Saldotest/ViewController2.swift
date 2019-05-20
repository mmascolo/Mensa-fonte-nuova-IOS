//
//  ViewController2.swift
//  Saldotest
//
//  Created by Michele Mascolo on 01/05/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//

import UIKit
import WebKit


class ViewController2: UIViewController,UITextFieldDelegate,WKNavigationDelegate  {
   
    @IBOutlet weak var menubutton2: UIBarButtonItem!
    
    
    
    @IBOutlet weak var pass_input: UITextField!
    @IBOutlet weak var user_input: UITextField!
   
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func useredited(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(user_input.text, forKey: "user")    }
    
    @IBAction func userchanged(_ sender: UITextField) {
        let defaults = UserDefaults.standard
        defaults.set(user_input.text, forKey: "user")       }
    
    @IBAction func passchange(_ sender: UITextField) {
        let defaults = UserDefaults.standard
        defaults.set(pass_input.text, forKey: "pass")
    }
    @IBAction func passedited(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(pass_input.text, forKey: "pass")      }
    
    @IBAction func testconn(_ sender: Any) {
      
        let defaults = UserDefaults.standard
        defaults.set("TEST", forKey: "connesso")

        self.esito.text = "Test in corso"
        let myURL = URL(string:"https://www.schoolesuite.it/default1/NSC_Login.aspx?installation_code=fontenuopre")
        let myRequest = URLRequest(url: myURL!)
        webView3.load(myRequest)
        
        
    }
    
    @IBOutlet weak var webView3: WKWebView!
    
    @IBOutlet weak var esito: UILabel!
    
    
    func webView (_ webView3: WKWebView, didFinish navigation: WKNavigation!) {
        
        let defaults = UserDefaults.standard
        
        
        if (webView3 == self.webView3)
        {
        
            
            if (defaults.string(forKey: "connesso") == "CHECK")
            {
                defaults.set("STOP", forKey: "connesso")
                print ("check")
                if (webView3.url?.absoluteString.contains("login") ?? false) {
                    self.esito.text = "Errore Credenziali"
                    let defaults = UserDefaults.standard
                    
                    defaults.set("0", forKey: "connesso"
                    )
                    
                }
                
                if (webView3.url?.absoluteString.contains("PWM_ChildrenList.aspx")) ?? false {
                    self.esito.text = "Credenziali OK"
                    let defaults = UserDefaults.standard
                    defaults.set("1", forKey: "connesso")
                }
                
            }
            
            
        
            
            
            
        if (defaults.string(forKey: "connesso") == "TEST")
        {
            let defaults = UserDefaults.standard
           

            let   user: String =  defaults.string(forKey: "user") ?? "NO"
            let   pass: String = defaults.string(forKey: "pass") ?? "NO"
            print(user + "  " + pass)
         
            webView3.evaluateJavaScript("document.getElementById('txtUsername').value='" + user + "';" + "document.getElementById('txtPassword').value='" + pass + "';" + "document.getElementById('btnOK').click()") { (result, error) -> Void in
                if error != nil {}
            }
             defaults.set("CHECK", forKey: "connesso")
            }
       
        }
    
    
        }
    /* *******************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
                if revealViewController() != nil {
                    menubutton2.target = revealViewController()
                    menubutton2.action = #selector(SWRevealViewController.revealToggle(_:))
                revealViewController().rearViewRevealWidth = 200
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        
        
        
        
        webView3.navigationDelegate = self

        self.user_input.delegate = self
        self.pass_input.delegate = self
        let defaults = UserDefaults.standard
        user_input.text = defaults.string(forKey: "user")
        pass_input.text = defaults.string(forKey: "pass")
        var sito  = defaults.string(forKey: "sito")
        if (sito == "") { sito = "1"}
        
   /*     defaults.set("", forKey: "defaultsKeys.keyOne")
        defaults.set("Another String Value", forKey: "defaultsKeys.keyTwo")
        .text
        
        */
        
       
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
