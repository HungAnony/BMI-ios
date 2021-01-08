//
//  ViewResultController.swift
//  BMI
//
//  Created by Ta Huy Hung on 4/5/20.
//  Copyright © 2020 ClassiOS. All rights reserved.
//

import Foundation
import UIKit


class ViewResultController : UIViewController{
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblBMI: UILabel!
    @IBOutlet weak var lblAdvice: UILabel!
    
    var descriptionBMI: String?
    var bmi: String?
    var advice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showData()
    }
    
    private func showData(){
        lblDescription.text = descriptionBMI!
        lblBMI.text = bmi!
        lblAdvice.text = advice!
    }
    
    @IBAction func popToRootView(_ sender: Any) {
         navigationController?.popToRootViewController(animated: true)
    }
    
}
