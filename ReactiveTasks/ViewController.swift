//
//  ViewController.swift
//  ReactiveTasks
//
//  Created by deepanshugautam on 2018/12/19.
//  Copyright © 2018 deepanshugautam. All rights reserved.
//

import ReactiveSwift
import Result
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let signalProducer = SignalProducer<Int,NoError> { (observer, _) in
            var value = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                observer.send(value: value)
                value += 1
            }
        }

        label.reactive.text <~ signalProducer.map { String($0) }
    }


}

