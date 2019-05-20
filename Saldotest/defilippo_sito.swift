//
//  defilippo_sito.swift
//  Menu
//
//  Created by Michele Mascolo on 12/05/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//

import UIKit
import WebKit

class defilippo_sito: UIViewController,WKUIDelegate,WKNavigationDelegate{

    @IBOutlet weak var button_menu: UIBarButtonItem!
    @IBOutlet weak var webView2: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            button_menu.target = revealViewController()
            button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        webView2.navigationDelegate = self
        
        
        let myURL2 = URL(string:"http://www.icsdefilippo.gov.it")
        let myRequest2 = URLRequest(url: myURL2!)
        webView2.load(myRequest2)
        
        
        
        // Do any additional setup after loading the view.

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
