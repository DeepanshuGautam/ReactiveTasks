//
//  ViewController.swift
//  ReactiveTasks
//
//  Created by deepanshugautam on 2018/12/19.
//  Copyright © 2018 deepanshugautam. All rights reserved.
//
import ReactiveCocoa

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.reactive.controlEvents(.touchUpInside).observeValues { name in
            print("touchUpInside")
        }
    }


}

