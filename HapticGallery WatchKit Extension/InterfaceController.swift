//
//  InterfaceController.swift
//  HapticGallery WatchKit Extension
//
//  Created by Sean White on 9/14/15.
//  Copyright © 2015 BrightSky Labs. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var myPicker: WKInterfacePicker!
    @IBOutlet var itemLabel: WKInterfaceButton!
    var currentHaptic: Int = 1
    
    var itemList: [(String)] = [
        ("Notification"),
        ("DirectionUp"),
        ("DirectionDown"),
        ("Success"),
        ("Failure"),
        ("Retry"),
        ("Start"),
        ("Stop"),
        ("Click")
        ]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
//        var hapticItems = [String]()
//        var m = 0
//        while let hapticItem = WKHapticType.init(rawValue: m) {
//            hapticItems.append(hapticItem)
//            m++
//        }
//        
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        
        myPicker.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerChanged(value: Int) {
        //itemLabel.setText(itemList[value].1)
        currentHaptic = value
    }
    @IBAction func feelButtonPressed() {
        WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.init(rawValue: currentHaptic)!);
    }

}
