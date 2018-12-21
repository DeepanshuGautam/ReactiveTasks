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

        let signal = Signal<String,NoError> { (observer, lifetime) in
            /*
             DispatchQueue is used because, signal starts immediately after initialization,
             so to observe it in time, have to delay the signal, in this case by 1 second
             */
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                observer.send(value: "String 1")
                observer.send(value: "String 2")
                observer.sendCompleted()
            }
        }

        signal.observeValues { string in
            print(string)
        }

        let signalProducer = SignalProducer<Int, NoError> { (observer, _) in
            observer.send(value: 1)
            observer.send(value: 2)
            observer.sendCompleted()
        }

        signalProducer.startWithValues { int in
            print(int)
        }
    }
}
