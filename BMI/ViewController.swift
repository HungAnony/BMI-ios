//
//  ViewController.swift
//  BMI
//
//  Created by Tạ Huy Hùng on 3/19/20.
//  Copyright © 2020 ClassiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblHeightValue: UILabel!
    @IBOutlet weak var lblWeightValue: UILabel!
    
    var realHeightValue : String = " "
    var realWeightValue : String = " "
    
    
    @IBAction func onHeightChanged(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        realHeightValue = String(format: "%.2f", currentValue)
        lblHeightValue.text =  realHeightValue + " m"
    }
    
    @IBAction func onWeightChanged(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        realWeightValue = String(format: "%.f", currentValue)
        lblWeightValue.text = realWeightValue + " kg"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handle(segue)
    }
    
    private func handle(_ segue : UIStoryboardSegue){
        if let viewResultController = segue.destination as? ViewResultController
        {
            let BMI = calBMI(realHeightValue, realWeightValue)
            viewResultController.bmi = getBMI(BMI)
            
            if(BMI < 0){
                viewResultController.descriptionBMI = "OOPS!"
                viewResultController.advice = "Vui lòng cuộn thanh trượt để phần mềm tính giá trị"
            }
            else if(BMI >= 0 && BMI < 18.5){
                viewResultController.descriptionBMI = "MỎNG HƠN A4"
                viewResultController.advice = "Nên ăn KFC thay cơm và ngủ 15 tiếng/ngày để mập hơn"
            }
            else if(BMI >= 18.5 && BMI <= 24.9){
                viewResultController.descriptionBMI = "BODY NGON"
                viewResultController.advice = "Chuẩn bị tập 6 múi đi xong còn kiếm gấu :) "
            }
            else if(BMI >= 25 && BMI <= 29.9){
                viewResultController.descriptionBMI = "HƠI MẬP"
                viewResultController.advice = "Có chút 'Minh béo', chạm môi em rồi"
            }
            else if(BMI >= 30 && BMI <= 34.9){
                viewResultController.descriptionBMI = "BÉO CẤP ĐỘ 1"
                viewResultController.advice = "Chúc mừng bạn đã kết bạn với Minh béo"
            }
            else if(BMI >= 35 && BMI <= 39){
                viewResultController.descriptionBMI = "BÉO CẤP ĐỘ 2"
                viewResultController.advice = "Chứng nhận bạn là bạn thân của Minh béo"
            }
            else{
                viewResultController.descriptionBMI = "BÉO VÃI ĐẠN :("
                viewResultController.advice = "Ăn gì lắm thế. Định ăn cả thế giới ah :))"
            }
        }
    }
    
    private func calBMI(_ height : String,_ weight : String) -> Decimal{
        if(height == " " || weight == " "){
            return -1
        }
        let result =  Decimal(string: weight)! / pow(Decimal(string : height)!, 2)
        return result
    }
    
    private func getBMI(_ bmi : Decimal)-> String{
        let result = (bmi as NSDecimalNumber).doubleValue
        let formatter = String(format: "%.1f", result)
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

