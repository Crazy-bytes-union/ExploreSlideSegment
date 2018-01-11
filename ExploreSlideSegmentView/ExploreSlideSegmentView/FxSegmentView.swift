//
//  FxSegmentView.swift
//  FXChat
//
//  Created by muhlenXi on 2018/1/8.
//  Copyright © 2018年 PengZhihao. All rights reserved.
//

import UIKit
import SnapKit

fileprivate let selectedColor = UIColor(red: 46/255.0, green: 169/255.0, blue: 223/255.0, alpha: 1.0)
fileprivate let normalColor = UIColor(red: 48/255.0, green: 48/255.0, blue: 48/255.0, alpha: 1.0)
fileprivate let font = UIFont(name: "PingFang SC", size: 16)


protocol FxSegmentViewDelegate: class {
    func onClickSegmentExposureBtn()
    func onClickSegmentConsultBtn()
    func onClickSegmentComplainBtn()
}


class FxSegmentView: UIView {

    weak var segmentDelegate: FxSegmentViewDelegate?
    
    // 下划线的宽度
    var underLinewidth: CGFloat = UIScreen.main.bounds.size.width/3 {
        didSet {
            setupSubviews()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            setupSelectedBtn(index: selectedIndex)
        }
    }
    
    lazy var exposureBtn: UIButton = {
        let exposure = UIButton()
        exposure.setTitle("曝光", for: .normal)
        exposure.setTitleColor(normalColor, for: .normal)
        exposure.setTitleColor(selectedColor, for: .selected)
        exposure.titleLabel?.font = font
        exposure.isSelected = true
        exposure.addTarget(self, action: #selector(self.onClickExposureBtn(_:)), for: .touchUpInside)
        return exposure
    }()
    
    lazy var consultBtn: UIButton = {
        let consult = UIButton()
        consult.setTitle("咨询", for: .normal)
        consult.setTitleColor(normalColor, for: .normal)
        consult.setTitleColor(selectedColor, for: .selected)
        consult.titleLabel?.font = font
        consult.isSelected = false
        consult.addTarget(self, action: #selector(self.onClickConsultBtn(_:)), for: .touchUpInside)
        return consult
    }()
    
    lazy var complainBtn: UIButton = {
        let complain = UIButton()
        complain.setTitle("投诉", for: .normal)
        complain.setTitleColor(normalColor, for: .normal)
        complain.setTitleColor(selectedColor, for: .selected)
        complain.titleLabel?.font = font
        complain.isSelected = false
        complain.addTarget(self, action: #selector(self.onClickComplainBtn(_:)), for: .touchUpInside)
        return complain
    }()
    
    lazy var blueLineView: UIView = {
        let blueLine = UIView()
        blueLine.backgroundColor = UIColor(red: 46/255.0, green: 169/255.0, blue: 223/255.0, alpha: 1.0)
        return blueLine
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Private method
    func setupSubviews() {
        self.backgroundColor = UIColor.white
        
        self.addSubview(blueLineView)
        self.addSubview(exposureBtn)
        self.addSubview(consultBtn)
        self.addSubview(complainBtn)
        
        blueLineView.snp.makeConstraints { (make) in
            make.leading.bottom.equalTo(0)
            make.width.equalTo(underLinewidth)
            make.height.equalTo(2)
        }
        exposureBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(blueLineView.snp.top).offset(-10)
            make.top.equalTo(10)
            make.leading.equalTo(0)
            make.trailing.equalTo(consultBtn.snp.leading).offset(0)
            make.width.equalTo(consultBtn.snp.width)
        }
        consultBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(exposureBtn.snp.bottom)
            make.top.equalTo(exposureBtn.snp.top)
            make.leading.equalTo(exposureBtn.snp.trailing).offset(0)
            make.trailing.equalTo(complainBtn.snp.leading).offset(0)
            make.width.equalTo(complainBtn.snp.width)
        }
        complainBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(exposureBtn.snp.bottom)
            make.top.equalTo(exposureBtn.snp.top)
            make.leading.equalTo(consultBtn.snp.trailing).offset(0)
            make.trailing.equalTo(0)
            make.width.equalTo(exposureBtn.snp.width)
        }
    }
    
    func setupSelectedBtn(index: Int) {
        if index == 0 {
            exposureBtn.isSelected = true
            consultBtn.isSelected = false
            complainBtn.isSelected = false
            blueLineView.snp.updateConstraints { (make) in
                make.leading.equalTo(0)
            }
            self.setNeedsUpdateConstraints()
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
        if index == 1 {
            consultBtn.isSelected = true
            exposureBtn.isSelected = false
            complainBtn.isSelected = false
            blueLineView.snp.updateConstraints { (make) in
                make.leading.equalTo(underLinewidth)
            }
            self.setNeedsUpdateConstraints()
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
        if index == 2 {
            complainBtn.isSelected = true
            exposureBtn.isSelected = false
            consultBtn.isSelected = false
            blueLineView.snp.updateConstraints { (make) in
                make.leading.equalTo(underLinewidth*2)
            }
            self.setNeedsUpdateConstraints()
            UIView.animate(withDuration: 0.25) {
                self.layoutIfNeeded()
            }
        }
    }

    // MARK: Click events
    @objc func onClickExposureBtn(_ sender: UIButton) {
        setupSelectedBtn(index: 0)
        self.segmentDelegate?.onClickSegmentExposureBtn()
    }
    
    @objc func onClickConsultBtn(_ sender: UIButton) {
        setupSelectedBtn(index: 1)
        self.segmentDelegate?.onClickSegmentConsultBtn()
    }
    
    @objc func onClickComplainBtn(_ sender: UIButton) {
        setupSelectedBtn(index: 2)
        self.segmentDelegate?.onClickSegmentComplainBtn()
    }
}
