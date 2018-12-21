//
//  ViewController.swift
//  ReactiveTasks
//
//  Created by deepanshugautam on 2018/12/19.
//  Copyright © 2018 deepanshugautam. All rights reserved.
//

import ReactiveSwift
import Result

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let inputValues = ["ios", "mobile", "android", "mercari", "tokyo"]
        let signalProducer = SignalProducer<String, NoError>.init(inputValues)
        signalProducer
            .filter { $0.count > 6 }
            .startWithValues { print($0) }
    }


}

