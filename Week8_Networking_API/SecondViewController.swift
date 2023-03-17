//
//  SecondViewController.swift
//  Week8_Networking_API
//
//  Created by Rania Arbash on 2023-03-17.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var image: UIImageView!
    
   
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var mainDetails: UITextView!
    var index : Int = 0
    
    var coursePackageFromAPI = (UIApplication.shared.delegate as! AppDelegate).coursePackageFromAPI

    
    
    
    
    @IBAction func swipToRight(_ sender: Any) {
        index -= 1
        if index > 0 {
            updateCourse(i: index)
        }
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func swiptoLeft(_ sender: Any) {
        index += 1
        if index < coursePackageFromAPI.count{
            updateCourse(i: index)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainDetails.text = "Student: \(coursePackageFromAPI.student)"
        self.becomeFirstResponder()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
        updateCourse(i: 0)
        
        
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }

    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("Why are you shaking me?")
        }
     
        
    }
    
    func updateCourse(i : Int){
        counter.text = "Course Number: \(i + 1)"
        courseCode.text = coursePackageFromAPI.data?[i].courseCode
        var url = URL(string: (coursePackageFromAPI.data?[i].image)!)
      
        do{
        var imagedata = try Data(contentsOf: url!)
        image.image = UIImage(data: imagedata)
        
        }catch {
            print(error)
        }
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
