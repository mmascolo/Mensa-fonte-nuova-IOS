//
//  saldo_ViewController.swift
//  Menu
//
//  Created by Michele Mascolo on 10/05/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//

import UIKit
import WebKit



class saldo_ViewController: UIViewController,UITextFieldDelegate, WKUIDelegate,WKNavigationDelegate,UITableViewDelegate,UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return bambini.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cella = self.tableView.dequeueReusableCell(withIdentifier: "Cellaa", for: indexPath) as! saldo_cell
        
        //ricavo un oggetto Alimento dalla lista in posizione row (il num di riga) e lo conservo
        let alimento = self.bambini[indexPath.row]
        let soldo = self.soldi[indexPath.row]
        //riempio la cella assegnando ad una label testuale il nome dell'alimento
        cella.bambinosaldo?.text = alimento
        cella.soldi?.text = soldo
        
    
        return cella
        
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var webView: WKWebView!
    var contabambini: Int = 0
    
    
    
    @IBOutlet weak var button_saldo: UIBarButtonItem!
    
   var bambini: [String] = []
   var soldi: [String] = []
    
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print ("OK")
        }))
      
        self.present(alert, animated: true, completion: nil)
    }
    
    


    
    
    
    
    
    
    @IBOutlet weak var bambinosaldo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cella")
        
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        let  connesso: String = defaults.string(forKey: "connesso") ?? "NO"
        if connesso == "NO" || connesso == "0"
        {
            createAlert (title: "errore credenziali",message: "Impostare le credenziali in impostazioni")
        }
        
        if (self.text1.text != "error" && connesso == "1" )
        {
            
            createAlert (title: "Credenziali ok",message: "Attendere il caricamento dei dati")        }
        text1.delegate = self
        text2.delegate = self
       
        
        if revealViewController() != nil {
            button_saldo.target = revealViewController()
            button_saldo.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        let myURL = URL(string:"https://www.schoolesuite.it/default1/NSC_Login.aspx?installation_code=fontenuopre")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if (webView == self.webView)
        {
            
            
            let defaults = UserDefaults.standard
            let  connesso: String = defaults.string(forKey: "connesso") ?? "NO"
            
            
            if connesso == "NO" || connesso == "0"
            {self.text1.text = "impostare credenziali"
                self.label1.text = "impostare credenziali"
                
                
            }
            if (self.text1.text != "error" && connesso == "1" )
            {
                self.label1.text = ""
                let defaults = UserDefaults.standard
                
                
                let   user: String =  defaults.string(forKey: "user") ?? "NO"
                let   pass: String = defaults.string(forKey: "pass") ?? "NO"
                print(user + "  " + pass)
                
                webView.evaluateJavaScript("document.getElementById('txtUsername').value='" + user + "';" + "document.getElementById('txtPassword').value='" + pass + "';" + "document.getElementById('btnOK').click()", completionHandler: { result, error  in
                    
                    if error != nil {
                        
                    }
                })
                
                
                
                
                if (webView.url?.absoluteString.contains("login") ?? false) {
                    self.text1.text = "error"
                }
                
                if (webView.url?.absoluteString.contains("PWM_ChildrenList.aspx")) ?? false {
                    
                    
                    webView.evaluateJavaScript("(function() { return (document.getElementById('tblChildrenList').rows.length); })();", completionHandler: { result, error in
                        if let height = result as? Int {
                            self.contabambini =  height - 1
                            print("numero righe")
                            print (height)
                        }
                    })
            print("contabambini")
               print(self.contabambini)
                    
                    
                    webView.evaluateJavaScript("(function(){var div=';';var ret;ret =';';var table = document.getElementById('tblChildrenList');for (var i = 1, row; row = table.rows[i]; i++) {col = row.cells[0]; ret = ret + row.cells[0].innerText + div+ row.cells[1].innerText+div;}return ret;})();",completionHandler: { result, error in
                        if let Nome = result as? String {
                        print(Nome ?? "nullo")
                        
                            
                            let appo = String(Nome.dropFirst())    // "ello"
                            let  fullName = String(appo.dropLast())
                            
                            
                            let fullNameArr = fullName.components(separatedBy: ";")
                            
                            
                            for (index, element) in fullNameArr.enumerated() {
                                if index % 2 == 0 {
                                   self.bambini.append(element)
                                } else {
                                self.soldi.append(element)
                                }
                            }
                           
                         
                            
                			self.tableView.reloadData()
                        }})
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
            }
        }
        
    
        
    }
    
    
    
    
    
    
    


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


