//
//  ListPeopleRouter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class ListPeopleRouter {
    weak var viewController: ListPeopleViewController?
    
    // MARK: Manual navigation
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController?.performSegue(withIdentifier: "ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController?.present(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController?.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController?.navigationController?.pushViewController(someWhereViewController, animated: true)
    }
    
    // MARK: Scene communication
    func passDataBetweenScenes(of segue: UIStoryboardSegue) {
        // NOTE: Teach the router which scenes it can communicate with
        if segue.identifier == "ShowSomewhereScene" {
            sendDataToSomewhereScene(segue)
        }
    }
    
    func sendDataToSomewhereScene(_ segue: UIStoryboardSegue) {
        // NOTE: Teach the router how to pass data to the next scene
        // let someWhereViewController = segue.destinationViewController as! SomeWhereViewController
        // someWhereviewController.objectId = viewController?.objectId
    }
}

// MARK: - Pass segue event to router for scene communication.
extension ListPeopleViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataBetweenScenes(of: segue)
    }
}
