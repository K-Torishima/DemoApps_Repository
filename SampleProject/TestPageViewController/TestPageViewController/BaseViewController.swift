//
//  ViewController.swift
//  TestPageViewController
//
//  Created by 鳥嶋 晃次 on 2021/03/08.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var pageViewController: UIPageViewController!
    private var viewControllers:[UIViewController] = []
    private var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        initPageViewController()
        setPageControl()
    }
    
    private func initPageViewController() {
        let vc1 = ViewController1()
        let vc2 = ViewController2()
        let vc3 = ViewController3()
        let viewControllers: [UIViewController] = [vc1, vc2, vc3]
        
        viewControllers.forEach { item in
            self.viewControllers.append(item)
        }
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.setViewControllers([self.viewControllers[0]], direction: .forward, animated: true, completion: nil)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        pageViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
    }
    
    private func setPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,
                                                  y: UIScreen.main.bounds.maxY - 190,
                                                  width: UIScreen.main.bounds.width
                                                  , height: 50))
        pageControl.numberOfPages = viewControllers.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .green
        view.addSubview(pageControl)
    }
}

// MARK:- Delegate DataSource
extension BaseViewController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        viewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 {
            return viewControllers[index + 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = viewControllers.firstIndex(of: viewController), index > 0 {
            return viewControllers[index - 1]
        } else {
            return nil
        }
    }
}

extension BaseViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let currentPage = pageViewController.viewControllers![0]
        pageControl.currentPage = viewControllers.firstIndex(of: currentPage)!
    }
}
