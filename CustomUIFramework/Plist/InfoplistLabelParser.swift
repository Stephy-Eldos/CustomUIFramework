//
//  InfoplistLabelParser.swift
//  CustomUIFramework
//
//  Created by Eldos Thomas on 9/5/22.
//

import Foundation

public struct InfoplistLabelParser: InfolistParser {
    
    public static func getIntValue(key: String, styleNo: String) -> Int {
        if let path = Bundle.main.path(forResource: Constants.Plist.Name, ofType: Constants.Plist.Extension) {
            if let dict2 = NSDictionary(contentsOfFile: path) {
                if let labelStylesDict = dict2.object(forKey: Constants.Plist.LabelStyle) as? NSDictionary {
                    if let labelStyle = labelStylesDict.object(forKey: styleNo) as? NSDictionary {
                        guard let value = labelStyle[key] as? Int else
                        {
                            fatalError()
                        }
                       return value
                    }
                }
            }
        }
        return 0
    }
    
    public static func getStringValue(key: String, styleNo: String) -> String {
        if let path = Bundle.main.path(forResource: Constants.Plist.Name, ofType: Constants.Plist.Extension) {
            if let dict2 = NSDictionary(contentsOfFile: path) {
                if let labelStylesDict = dict2.object(forKey: Constants.Plist.LabelStyle) as? NSDictionary {
                    if let labelStyle = labelStylesDict.object(forKey: styleNo) as? NSDictionary {
                        guard let value = labelStyle[key] as? String else
                        {
                            fatalError()
                        }
                       return value
                    }
                }
            }
        }
        return ""
    }
}
