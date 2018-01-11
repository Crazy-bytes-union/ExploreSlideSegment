//
//  ViewController.swift
//  ExploreSlideSegmentView
//
//  Created by muhlenXi on 2018/1/11.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.lightGray
        
        let segment = FxSegmentView()
        segment.segmentDelegate = self
        segment.underLinewidth = (UIScreen.main.bounds.width-20)/3.0
        self.view.addSubview(segment)
        segment.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(50)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: FxSegmentViewDelegate {
    func onClickSegmentConsultBtn() {
        print("onClickSegmentConsultBtn")
    }
    
    func onClickSegmentComplainBtn() {
        print("onClickSegmentComplainBtn")
    }
    
    func onClickSegmentExposureBtn() {
        print("onClickSegmentExposureBtn")
    }
}

