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
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds))
    }
    
    static func getLocalDateTime(milliSeconds:Int)->String
    {
        let df = DateFormatter()
        let time = Date(milliseconds: milliSeconds)
        df.dateFormat = "dd/MM/yy hh:mm a"
        return df.string(from: time)
    }
}
