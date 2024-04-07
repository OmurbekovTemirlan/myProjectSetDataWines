//
//  TabBarView.swift
//  myProject
//
//  Created by Apple on 5.4.2024.
//

import UIKit

class TabBarView: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppeareance()
    }
    
    private func generateTabBar(){
        
        viewControllers = [
            generateVC(viewController: HomeView(), title: "Home", image: UIImage(systemName: "house") ),
            generateVC(viewController: ContactsView(), title: "Contacts", image: UIImage(systemName: "person.circle")),
            generateVC(viewController: ChatsView(), title: "Chats", image: UIImage(systemName: "message")),
            generateVC(viewController: SettingsView(), title: "Settings", image: UIImage(systemName: "gear")),
        ]
        
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage? ) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppeareance() {
        let positionOnX: CGFloat = 0
        let positionOnY: CGFloat = 3
        
        let width = tabBar.bounds.width - positionOnX
        let height = tabBar.bounds.height + positionOnY * 14
        
        
        let bezierPath = UIBezierPath(roundedRect:
                                        CGRect( x: positionOnX,
                                                y: positionOnY,
                                                width: width,
                                                height: height),
                                      cornerRadius: 0 )

        
        tabBar.itemWidth = width
        tabBar.itemPositioning = .centered
        
        
        tabBar.backgroundImage = UIImage()
        tabBar.isTranslucent = true
        
        let blurEfect = UIBlurEffect(style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEfect)
        blurView.frame = bezierPath.bounds
        tabBar.insertSubview(blurView, at: 0)
       
        
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
