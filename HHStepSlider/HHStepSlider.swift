//
//  HHSlider.swift
//  HHStepSlider
//
//  Created by huangjianwu on 2017/9/14.
//  Copyright © 2017年 huangjianwu. All rights reserved.
//

import UIKit

protocol HHStepSliderDelegate :class{
    /// 最终停止的值，经过计算
    ///
    /// - Parameter slider: 当前的sliderView
    func valueChanged(_ slider:HHStepSlider)
}

/// 封装系统的UISliderView,实现步进功能
class HHStepSlider: UIView {

    /// sliderview
    var slider = UISlider()
    /// 步进值
    var stepValue: Float = 10.0
    /// 当前值
    var currentValue: Float = 0.0
    /// delegate
    weak var delegate: HHStepSliderDelegate?


    override init(frame: CGRect) {
        super.init(frame: frame)
        slider.frame = self.bounds
        //默认停止拖动才valuechange
        slider.isContinuous = false
        slider.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        self.addSubview(slider)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func valueChanged(_ slider1: UISlider) {
        DLog("滑动值%f", slider1.value)
        currentValue = slider1.value

        let upper = ceil(currentValue / stepValue)
        let low = floor(currentValue / stepValue)
        let left = upper * stepValue - currentValue
        let right = currentValue - low * stepValue
        /// <#Description#>
        if left > right {
            slider.setValue(upper * stepValue, animated: true)
            currentValue = upper * stepValue
        }
            else {
                slider.setValue(low * stepValue, animated: true)
                currentValue = low * stepValue
        }
        DLog("最终值%f", currentValue)
        if (delegate != nil) {
            self.delegate?.valueChanged(self)
        }

    }
}
