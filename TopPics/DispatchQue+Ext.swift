//
//  DispatchQue+Ext.swift
//  TopPics
//
//  Created by Rajeev Radhakrishnan on 06/11/22.
//

import Foundation

func ExecuteOnMain(_ block: @escaping ()->()) {
    if Thread.isMainThread {
        block()
    }
    else {
        DispatchQueue.main.async(execute: block)
    }
}
