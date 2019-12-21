//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Jonathon Chenvert on 12/12/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    let twitterRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Adds the refresh feature to load new content (tweets)
        twitterRefreshControl.addTarget(self, action: #selector(loadTweets), for: .valueChanged)
        tableView.refreshControl = twitterRefreshControl
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadTweets()
    }
    
    // Loads the initial tweets upon app launch
    @objc func loadTweets() {
        
        numberOfTweets = 20
        
        let twitterUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let twitterParams = ["count": numberOfTweets]
        
        // Call API and get tweets
        TwitterAPICaller.client?.getDictionariesRequest(url: twitterUrl, parameters: twitterParams, success: { (tweets: [NSDictionary]) in
            
            // Empties array prior to use
            self.tweetArray.removeAll()
            
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            
            self.tableView.reloadData()
            
            // Terminates the refresh logo
            self.twitterRefreshControl.endRefreshing()
            
        }, failure: { (Error) in
            print("Could not retrieve tweets!")
        })
    }
    
    // Adds more tweets to load for user
    func loadMoreTweets() {
        
        let twitterUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        numberOfTweets += 20 // Adds an additional 20 tweets to load
        let twitterParams = ["count": numberOfTweets]
        
        // Call API and get tweets
        TwitterAPICaller.client?.getDictionariesRequest(url: twitterUrl, parameters: twitterParams, success: { (tweets: [NSDictionary]) in
            
            // Empties array prior to use
            self.tweetArray.removeAll()
            
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Could not retrieve tweets!")
        })
    }

    // Loads more tweets when user scrolls down towards the end of the Twitter feed
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == tweetArray.count {
            loadMoreTweets()
        }
    }
    
    // Sets the TableView cell with Twitter content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        // Sets username and tweet contents in labels
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetContentLabel.text = tweetArray[indexPath.row]["text"] as? String
        
        // Modifies (from Twitter API format) and sets the tweet creation date
        let twitterTimestamp = (tweetArray[indexPath.row]["created_at"] as? String)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee MMM dd HH:mm:ss ZZZZ yyyy"
        if let date = dateFormatter.date(from: twitterTimestamp) {
            let df = DateFormatter()
            df.dateStyle = .short
            df.timeStyle = .short
            let result = df.string(from: date)
            cell.tweetDateLabel.text = result
        }
        
        // Sets Twitter post image
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.profileImageView.image = UIImage(data: imageData)
        }
        
        cell.setFavorite(tweetArray[indexPath.row]["favorited"] as! Bool)
        cell.tweetId = tweetArray[indexPath.row]["id"] as! Int
        cell.setRetweeted(tweetArray[indexPath.row]["retweeted"] as! Bool)
                
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }
}
