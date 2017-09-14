//
//  ViewController.swift
//  HHStepSlider
//
//  Created by huangjianwu on 2017/9/14.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit

func DLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

class ViewController: UIViewController,HHStepSliderDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let slider:HHStepSlider = HHStepSlider(frame: CGRect(x: 10, y: 100, width: 300, height: 40))
        slider.slider.maximumValue = 100
        slider.slider.minimumValue = 1
        self.view.addSubview(slider)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func valueChanged(_ slider: HHStepSlider) {
        
    }

}

