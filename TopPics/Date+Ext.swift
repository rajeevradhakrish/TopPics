//
//  Date+Ext.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import Foundation

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    static func getLocalDateTime(milliSeconds:Int64)->String
    {
        let df = DateFormatter()
        let time = Date(milliseconds: milliSeconds)
        df.dateFormat = "y-MM-dd H:mm:ss.SSSS"
        return df.string(from: time)
    }
}
