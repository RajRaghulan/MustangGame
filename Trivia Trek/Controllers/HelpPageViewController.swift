//
//  HelpPageViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/22/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit



class HelpPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pages: [UIViewController] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.dataSource = self
        
        self.pages = [self.loadPage(number: "One"),
                      self.loadPage(number: "Two"),
                      self.loadPage(number: "Three"),
                      self.loadPage(number: "Four")]
        
        self.setViewControllers([self.pages[0]], direction: .forward, animated: true, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.pages.firstIndex(of: viewController) else {

            return nil

        }

        let prevIndex = index - 1

        guard prevIndex >= 0 else {

            return nil

        }
        
        return self.pages[prevIndex]

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = self.pages.firstIndex(of: viewController) else {

            return nil

        }

        let nextIndex = index + 1

        guard nextIndex <= self.pages.count - 1 else {
            
            return nil

        }

        return self.pages[nextIndex]

    }
    
    private func loadPage(number: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page\(number)")
        
    }
    
}
