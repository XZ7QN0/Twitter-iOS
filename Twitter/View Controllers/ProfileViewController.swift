//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Jonathon Chenvert on 12/20/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var twitterBannerImage: UIImageView!
    @IBOutlet weak var twitterProfileImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var postedTweetsLabel: UILabel!
    @IBOutlet weak var likedTweetsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadProfile()
    }
    
    // Loads the user's profile with the following items:
    // Banner, profile image, full name, username, following, followers, posts, and likes
    func loadProfile() {
        let url = "https://api.twitter.com/1.1/users/show.json"
        // Hard-coded screen_name because we are unable to retrieve user's screen_name with Twitter authentication method
        // Got help from Guillermo on this issue at Dec 20, 2019 @ 3:28 PM PST
        let twitterParams = ["screen_name": "newdevontherock"]
                
        TwitterAPICaller.client?.getDictionaryRequest(url: url, parameters: twitterParams, success: { (account: NSDictionary) in
            //
            let imageUrl = URL(string: (account["profile_banner_url"] as? String)!)
            let data = try? Data(contentsOf: imageUrl!)
            
            if let imageData = data {
                self.twitterBannerImage.image = UIImage(data: imageData)
            }
            
            let imageUrl2 = URL(string: (account["profile_image_url_https"] as? String)!)
            let data2 = try? Data(contentsOf: imageUrl2!)
            
            if let imageData2 = data2 {
                self.twitterProfileImage.image = UIImage(data: imageData2)
            }
            
            let usernameString = account["screen_name"] as! String
            let numberOfFollowings = account["friends_count"] as! Int
            let numberOfFollowers = account["followers_count"] as! Int
            let totalTweets = account["favourites_count"] as! Int
            let likedTweets = account["statuses_count"] as! Int
            
            self.fullNameLabel.text = account["name"] as? String
            self.usernameLabel.text = "@\(usernameString)"
            self.followingLabel.text = "\(numberOfFollowings) following"
            
            if numberOfFollowers < 1 {
                self.followersLabel.text = "\(numberOfFollowers) followers"
            } else {
                self.followersLabel.text = "\(numberOfFollowers) follower"
            }
            
            self.postedTweetsLabel.text = "\(totalTweets) tweets tweeted total"
            self.likedTweetsLabel.text = "\(likedTweets) liked tweets"
            
        }, failure: { (Error) in
            print("Error in getting user profile provisions")
        })
    }
    
    // Exits out of profile and returns user to Twitter feed
    @IBAction func didExitProfile(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Logs user out of Twitter and returns to the login screen
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        
        // Dismisses two View Controllers to be able to go back to the login page.
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
}
