//
//  ViewController.swift
//  ReactiveTasks
//
//  Created by deepanshugautam on 2018/12/19.
//  Copyright © 2018 deepanshugautam. All rights reserved.
//

import ReactiveCocoa
import ReactiveSwift

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        label.reactive.text <~ textField.reactive.continuousTextValues
        label.reactive.textColor <~ textField.reactive.continuousTextValues.filterMap {
            guard let value = $0 else { return nil }
            if value.count > 5 && value.count < 10 {
                return UIColor.green
            } else {
                return UIColor.red
            }
        }
    }
}

