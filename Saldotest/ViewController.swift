//
//  ViewController.swift
//  Saldotest
//
//  Created by Michele Mascolo on 30/04/2019.
//  Copyright © 2019 Michele Mascolo. All rights reserved.
//

import UIKit
// import WebKit


class ViewController: UIViewController,  UITextFieldDelegate, UICollectionViewDelegate,UICollectionViewDataSource
    
    
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cella", for: indexPath as IndexPath) as! CollectionViewCell
        
        //impostiamo l'immagine e il testo della label con quelli precedentemente dichiarati nelle due variabili
        
        
        //  self.datepicker.setDate(Date(), animated: false)
        //datepicker.datePickerMode = UIDatePicker.Mode.date
        // print(selectedDate)
        
        let fullName : String = pageData[indexPath.row]
        
        
        
        let fullNameArr : [String] = fullName.components(separatedBy: ";")
        
        
        cell.label1?.text = fullNameArr[1] + " " + fullNameArr[0]
        
        cell.label2?.text = fullNameArr[2]
        cell.label3?.text = fullNameArr[3]
        cell.label4?.text = fullNameArr[4]
        cell.label5?.text = fullNameArr[5]
        
        
        //  self.contorno.text = fullNameArr[4]
        //  self.dolce.text = fullNameArr[5]
        
        
        // cell.label1?.text = prodottiApple[indexPath.row]
        
        
        
        
        
        
        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func findinarray(value searchString: String, in arr: [String]) -> String?
    {
        let filtered = arr.filter { $0.contains(searchString) }
        if filtered.count>0
        {
        return filtered[0]
        
        }else  {return ";;;;;;" }
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        return pageData.count
    }
    
    
    
    
    

    
    
 
    
    var pageData: [String] = [ ";;;;;;","01/04/2019;LUNEDI;Risotto con zucchine;Polpette al forno;Spinaci;Frutta di stagione","02/04/2019;MARTEDI;Gnocchetti al pomodoro;Mozzarella o formaggio;Pomodori/finocchi;Frutta di stagione","03/04/2019;MERCOLEDI;Pasta al burro;Arrosto di tacchino;Carote;Dessert","04/04/2019;GIOVEDI;Minestra di legumi;Prosciutto cotto;Fagiolini;Frutta di stagione","05/04/2019;VENERDI;Pasta al tonno con pomodoro;Filetti di platessa impanati;insalata mista;Frutta di stagione","06/04/2019;SABATO; ; ; ; ;","07/04/2019;DOMENICA; ; ; ; ;","08/04/2019;LUNEDI;Pasta all’Amatriciana;Grana / formaggio;Bieta all’agro;Frutta di stagione","09/04/2019;MARTEDI;Risotto alla parmigiana;Arista di maiale;Insalata;Frutta di stagione","10/04/2019;MERCOLEDI;Pasta  e piselli in bianco;Prosciutto cotto;Fagiolini all’agro;Frutta di stagione","11/04/2019;GIOVEDI;Pasta al pomodoro;Bastoncini merluzzo;Carote al vapore;Succo di frutta","12/04/2019;VENERDI;Pasta e patate;Nuggets di pollo;pomodori/finocchi;Frutta di stagione","13/04/2019;SABATO; ; ; ; ;","14/04/2019;DOMENICA; ; ; ; ;","15/04/2019;LUNEDI;Pasta al pesto;Bresaola;Fagiolini;Frutta di  stagione","16/04/2019;MARTEDI;Pasta al  pomodoro;Coscio pollo forno;Carote filangee;Gelato","17/04/2019;MERCOLEDI;Risotto primavera;Bocconcini di Merluzzo;bieta;Succo di frutta","18/04/2019;GIOVEDI;Gnocchetti di semola al pomodoro;Arrosto di vitellone;pomodori/finocchi;Frutta di stagione","19/04/2019;VENERDI;Pasta olio e parmigiano;Mozzarella o formaggio;insalata;Frutta di stagione","20/04/2019;SABATO; ; ; ; ;","21/04/2019;DOMENICA; ; ; ; ;","22/04/2019;LUNEDI; ; ; ; ;","23/04/2019;MARTEDI; ; ; ; ;","24/04/2019;MERCOLEDI; ; ; ; ;","25/04/2019;GIOVEDI; ; ; ; ;","26/04/2019;VENERDI; ; ; ; ;","27/04/2019;SABATO; ; ; ; ; ;","28/04/2019;DOMENICA; ; ; ; ;","29/04/2019;LUNEDI;Pasta al burro;Scaloppine tacchino;pomodori/finocchi;Frutta di stagione","30/04/2019;MARTEDI;Pasta pomodoro e basilico;Filetti di platessa mugnaia;Patate lesse/forno;Frutta di stagione","01/05/2019;MERCOLEDI; ; ; ; ;","02/05/2019;GIOVEDI;Pasta e zucchine;Prosciutto cotto;Insalata;Frutta di stagione","03/05/2019;VENERDI;Risotto al pomodoro;Frittata;Fagiolini all’agro;Dessert","04/05/2019;SABATO; ; ; ; ; ;","05/05/2019;DOMENICA; ; ; ; ;","06/05/2019;LUNEDI;Pasta al tonno;Filettoni di merluzzo forno;spinaci;Frutta di stagione","07/05/2019;MARTEDI;Fettuccine al ragù;Mozzarella/formaggio;Pomodori/finocchi;Frutta di stagione","08/05/2019;MERCOLEDI;Minestra di legumi;Prosciutto cotto;Fagiolini;Gelato","09/05/2019;GIOVEDI;Risotto con piselli;Fesa di tacchino;Carote;Frutta di stagione","10/05/2019;VENERDI;Pasta al pomodoro;Polpette Vitellone forno;Piselli al vapore;Frutta di stagione","11/05/2019;SABATO; ; ; ; ; ;","12/05/2019;DOMENICA; ; ; ; ;","13/05/2019;LUNEDI;Gnocchetti al pomodoro;Mozzarella o formaggio;Pomodori/finocchi;Frutta di stagione","14/05/2019;MARTEDI;Pasta al burro;Arrosto di tacchino;Carote;Dessert","15/05/2019;MERCOLEDI;Minestra di legumi;Prosciutto cotto;Fagiolini;Frutta di stagione","16/05/2019;GIOVEDI;Pasta al tonno con pomodoro;Filetti di platessa impanati;insalata mista;Frutta di stagione","17/05/2019;VENERDI;Risotto con zucchine;Polpette al forno;Spinaci;Frutta di stagione","18/05/2019;SABATO; ; ; ; ; ;","19/05/2019;DOMENICA; ; ; ; ;","20/05/2019;LUNEDI;Risotto alla parmigiana;Arista di maiale;Insalata;Frutta di stagione","21/05/2019;MARTEDI;Pasta  e piselli in bianco;Prosciutto cotto;Fagiolini all’agro;Frutta di stagione","22/05/2019;MERCOLEDI;Pasta al pomodoro;Bastoncini merluzzo;Carote al vapore;Succo di frutta","23/05/2019;GIOVEDI;Pasta e patate;Nuggets di pollo;pomodori/finocchi;Frutta di stagione","24/05/2019;VENERDI;Pasta all’Amatriciana;Grana / formaggio;Bieta all’agro;Frutta di stagione","25/05/2019;SABATO; ; ; ; ; ;","26/05/2019;DOMENICA; ; ; ; ;","27/05/2019;LUNEDI;Pasta al  pomodoro;Coscio pollo forno;Carote filangee;Gelato","28/05/2019;MARTEDI;Risotto primavera;Bocconcini di Merluzzo;bieta;Succo di frutta","29/05/2019;MERCOLEDI;Gnocchetti di semola al pomodoro;Arrosto di vitellone;pomodori/finocchi;Frutta di stagione","30/05/2019;GIOVEDI;Pasta olio e parmigiano;Mozzarella o formaggio;insalata;Frutta di stagione","31/05/2019;VENERDI;Pasta al pesto;Bresaola;Fagiolini;Frutta di  stagione","01/06/2019;SABATO; ; ; ; ; ;","02/06/2019;DOMENICA; ; ; ; ;","03/06/2019;LUNEDI;MARTEDI;Pasta pomodoro e basilico;Filetti di platessa mugnaia;Patate lesse/forno;Frutta di stagione","04/06/2019;MARTEDI;Tagliatelle al pomodoro;Polpette Vitellone al forno;Bieta all'agro;Frutta di stagione","05/06/2019;MERCOLEDI;Pasta e zucchine;Prosciutto cotto;Insalata;Frutta di stagione","06/06/2019;GIOVEDI;Risotto al pomodoro;Frittata;Fagiolini all’agro;Dessert","07/06/2019;VENERDI;Pasta al burro;Scaloppine tacchino;pomodori/finocchi;Frutta di stagione","08/06/2019;SABATO; ; ; ; ; ;","09/06/2019;DOMENICA; ; ; ; ;","10/06/2019;LUNEDI;Fettuccine al ragù;Mozzarella/formaggio;Pomodori/finocchi;Frutta di stagione","11/06/2019;MARTEDI;Minestra di legumi;Prosciutto cotto;Fagiolini;Gelato","12/06/2019;MERCOLEDI;Risotto con piselli;Fesa di tacchino;Carote;Frutta di stagione","13/06/2019;GIOVEDI;Pasta al pomodoro;Polpette Vitellone forno;Piselli al vapore;Frutta di stagione","14/06/2019;VENERDI;Pasta al tonno;Filettoni di merluzzo forno;spinaci;Frutta di stagione","15/06/2019;SABATO; ; ; ; ; ;","16/06/2019;DOMENICA; ; ; ; ;","17/06/2019;LUNEDI; Pasta al tonno;Filettoni di merluzzo;Spinaci;Frutta di stagione","18/06/2019;MARTEDI;Minestra di legumi;Prosciutto cotto;Fagiolini;Frutta di stagione","19/06/2019;MERCOLEDI;Pasta al tonno con pomodoro;Filetti di platessa impanati;insalata mista;Frutta di stagione","20/06/2019;GIOVEDI;Risotto con zucchine;Polpette al forno;Spinaci;Frutta di stagione","21/06/2019;VENERDI; Gnocchetti al pomodoro;Mozzarella o formaggio;Pomodori/finocchi;Frutta di stagione","22/06/2019;SABATO; ; ; ; ;","23/06/2019;DOMENICA; ; ; ; ;","24/06/2019;LUNEDI;Pasta  e piselli in bianco;Prosciutto cotto;Fagiolini all’agro;Frutta di stagione","25/06/2019;MARTEDI;Pasta al pomodoro;Bastoncini merluzzo;Carote al vapore;Succo di frutta","26/06/2019;MERCOLEDI; Pasta e patate;Nuggets di pollo;pomodori/finocchi;Frutta di stagione","27/06/2019;GIOVEDI;Pasta all’Amatriciana;Grana / formaggio;Bieta all’agro;Frutta di stagione","28/06/2019;VENERDI;Risotto alla parmigiana;Arista di maiale;Insalata;Frutta di stagione","29/06/2019;SABATO; ; ; ; ;","30/06/2019;DOMENICA; ; ; ; ;"
]
  
    
    var colors = ["SALDO"]
    var contabambini: Int = 0
    
    
    
  
    
    @IBOutlet weak var coll: UICollectionView!
    
    @IBOutlet weak var a: UILabel!
    
    @IBOutlet weak var collection: UICollectionView!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    
   //  https://www.appcoda.com/sidebar-menu-swift/
    
    func scrollToIndex(index: Int) {
        let indexPath = NSIndexPath(item: index, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: .right, animated: false)
    }
    
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
    
    
    
   
    
    
    override func viewDidLoad() {
               super.viewDidLoad()
        
        
        if revealViewController() != nil {
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        var posizione = 0
        
        collectionView.delegate = self
        collectionView.dataSource = self
     
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let date = dateFormatter.string(from: Date())
        posizione  =  Int(date) ?? 0
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MM"
        let mese = dateFormatter2.string(from: Date())
        print(mese)
        
        
        if (mese == "05") {posizione = ((posizione ) + 30)}
        
        
        if (mese == "06") {posizione = ( (posizione) + 61)}
         
        if ( posizione < 0){ posizione = 0 }
        if ( posizione > pageData.count ){ posizione = pageData.count }
        
      
        
  
       self.collectionView.scrollToItem(at:IndexPath(item: posizione, section: 0), at: .right, animated: false)
        self.collectionView.layoutSubviews()
        
      //  self.datepicker.setDate(Date(), animated: false)
        //datepicker.datePickerMode = UIDatePicker.Mode.date
    
       // print(selectedDate)
        
      
        
      //  self.primo.text = fullNameArr[2]
        
      //  self.secondo.text = fullNameArr[3]
      //  self.contorno.text = fullNameArr[4]
      //  self.dolce.text = fullNameArr[5]
        
        
        
        
        
        
        
        
    //    self.picker2.delegate = self
      //
      //  self.picker2.dataSource = self
     
        
        
    }
}


// Setting


// Getting



