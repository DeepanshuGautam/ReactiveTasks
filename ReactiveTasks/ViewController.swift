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

        let inputArray = [7,4,2,8,1]
        let signalProducer = SignalProducer<Int, NoError>.init(inputArray)
        signalProducer
            .reduce(0) { initial, next in initial + next }
            .startWithValues { print($0) }
    }


}

