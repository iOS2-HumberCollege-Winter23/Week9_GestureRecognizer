//
//  DataModelClasses.swift
//  Week8_Networking_API
//
//  Created by Rania Arbash on 2021-03-26.
//

import Foundation


class CoursePackage : Codable {
    var student: String = "NoStudent"
    var version : String = ""
    var count : Int = 0
    var data : [Course]?
}

class Course : Codable {
    var id : Int
    var courseCode: String
    var courseName : String
    var image : String
    
    init(i : Int, code:String,name:String, img: String) {
        id = i
        courseCode = code
        courseName = name
        image = img
    }
}

