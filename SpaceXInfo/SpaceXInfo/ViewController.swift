//
//  ViewController.swift
//  SpaceXInfo
//
//  Created by Vladislav on 20.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var rockets:[RocketElement] = []
    var slides:[Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let request = URLRequest(url: URL(string:"https://api.spacexdata.com/v4/rockets")!)
        
        
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            
            if let data = data, let rocketArray = try? JSONDecoder().decode(Array<RocketElement>.self, from: data)
            {
                for rocket in rocketArray {
                    print(rocket.name)
                }
                
                self.rockets = rocketArray
                                        
            }
        }
        
        task.resume()
        
        Thread.sleep(forTimeInterval: 15)
        
        self.slides = self.createSlides(self.rockets)
        self.setupSlideScrollView(slides: self.slides)
        self.pageControl.numberOfPages = self.slides.count
        self.pageControl.currentPage = 0
        self.view.bringSubviewToFront(self.pageControl)
        
    }
    
    func createSlides(_ array: [RocketElement]) -> [Slide] {
        var result: [Slide] = []
        var index = 1
        for arr in array {
            let slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            
            slide.labelTitle.text = arr.name
            
            let stringUrlImage = arr.flickrImages[0]
            let url = URL(string: stringUrlImage)!
            
            DispatchQueue.global().async { [weak self] in
                        if let data = try? Data(contentsOf: url) {
                            if let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    slide.imageView.image = image
                                }
                            }
                        }
                    }
            
            result.append(slide)
            index += 1
        }
                
        return result
    }

    func setupSlideScrollView(slides: [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
                
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height:view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

}
