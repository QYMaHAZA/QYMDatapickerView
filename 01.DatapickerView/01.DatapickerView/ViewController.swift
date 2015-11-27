//
//  ViewController.swift
//  01.DatapickerView
//
//  Created by mqy on 15/8/19.
//  Copyright © 2015年 qyma. All rights reserved.
//

import UIKit
//,,UIPickerViewDataSource,UIPickerViewDelegate
class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //加载
      loadDatePick()
    }
    func loadDatePick(){
       // textView.delegate = self
        textView.inputView = datePicker
        textView.inputAccessoryView =  toolBar
    }

/// 懒加载 控件
    //datePicker
    lazy private var datePicker :UIDatePicker = {
        
        let  picker = UIDatePicker()
        picker.datePickerMode = UIDatePickerMode.DateAndTime
        picker.locale = NSLocale(localeIdentifier: "zh-Hans")
        
        picker.timeZone = NSTimeZone(name: "GMT")
        picker.backgroundColor = UIColor.whiteColor()
        //设置默认时间
        picker.date = NSDate()
        picker.minimumDate = NSDate()
        
        picker.addTarget(self, action: "changeDate", forControlEvents: UIControlEvents.ValueChanged)
        
        return picker
        
        
        }()
    //toolBar
    lazy private var toolBar: UIToolbar = {
        
        let toolbar = UIToolbar()
        toolbar.backgroundColor = UIColor.clearColor()
        
        toolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 44)
        //确定按钮
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 32))
        
        doneButton.setBackgroundImage(UIImage(named: "actionSheet_destructive_btn"), forState: UIControlState.Normal)
        doneButton.setTitle("确定", forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "done", forControlEvents: UIControlEvents.TouchUpInside)
        
        //取消按钮
        let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 32))
        
        cancelButton.setBackgroundImage(UIImage(named: "actionSheet_normal_btn"), forState: UIControlState.Normal)
        
        cancelButton.setTitle("取消", forState: UIControlState.Normal)
        
        cancelButton.addTarget(self , action: "cancel", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //中间文字
        let  textLable = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textLable.textAlignment = NSTextAlignment.Center
        textLable.text = "请选择时间日期"
        textLable.textColor = UIColor.blackColor()
        
        let doneItem = UIBarButtonItem(customView: doneButton)
        let cancelItem = UIBarButtonItem(customView: cancelButton)
        let labelItem = UIBarButtonItem(customView: textLable)
        //中间弹簧
        let filexItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolbar.items = [cancelItem,filexItem,labelItem,filexItem,doneItem]
        
        return toolbar
        }()
    
   //确定按钮点击
    func changeDate(){
        
        done()
    }
    
    func done(){
        let format = NSDateFormatter()
        format.dateFormat = "yyyy年MM月dd日 HH:mm"
        
        var currentDate = datePicker.date
        
        if currentDate == "" {
            currentDate = NSDate()
        }
        textView.text = format.stringFromDate(currentDate)
    }
    //取消按钮点击
    func cancel(){
        textView.resignFirstResponder()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("----")
    }
}

