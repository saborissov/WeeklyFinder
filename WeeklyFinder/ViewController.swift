//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by 17586317 on 13.08.2020.
//  Copyright © 2020 Борисов Сергей Александрович. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var monthInput: UITextField!
    @IBOutlet weak var YearInput: UITextField!
    @IBOutlet weak var resulyLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        //Убираем опциональные типы с помощью условий проверки guard
        guard let day = dateInput.text, let month = monthInput.text, let year = YearInput.text else {
            return
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormater = DateFormatter ()
        
        //Локализация - перевод
        dateFormater.locale = Locale(identifier: "ru_Ru")
        dateFormater.dateFormat = "EEEE"
        
        
        
        //        resulyLabel.text = weekday
        if day == "" || month == "" || year == ""{
            resulyLabel.text = """
            Заполните все поля!
            Пример:
            Day: 30
            Moth: 5
            Year: 2020
            """
        }
            
        else {
            let date = calendar.date(from: dateComponents)
            let weekday = dateFormater.string(from: date!)
            let  capitalazed = weekday.capitalized
            resulyLabel.text = capitalazed
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

