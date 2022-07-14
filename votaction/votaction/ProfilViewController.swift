//
//  ProfilViewController.swift
//  votaction
//
//  Created by Alexandre Marcos on 11/06/2022.
//

import UIKit

class ProfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.9215686275, green: 0.2745098039, blue: 0.4235294118, alpha: 1).cgColor, #colorLiteral(red: 0.9411764706, green: 0.5882352941, blue: 0.462745098, alpha: 1).cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
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
