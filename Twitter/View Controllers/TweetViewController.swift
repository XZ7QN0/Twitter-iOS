//
//  TweetViewController.swift
//  Twitter
//
//  Created by Jonathon Chenvert on 12/18/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var tweetCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextView.becomeFirstResponder()
        self.tweetTextView.delegate = self
        self.tweetTextView.layer.borderWidth = 1.0
    }
    
    // Cancels the tweet and dismisses the controller
    @IBAction func didCancelTweet(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Sends out tweets.
    @IBAction func didTweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet: \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Set Twitter's max character limit
        let characterLimit = 280
        
        // Counts number of characters are left for Tweet feed
        let currentText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfCharacters = characterLimit - currentText.count
        tweetCounter.text = String("\(numberOfCharacters) / \(characterLimit)")

        // Gets current tweet, use empty string if failed
        let tweetText = textView.text ?? ""
        
        // Read the range they are trying to change
        guard let stringRange = Range(range, in: tweetText) else {
            return false
        }
        
        // Add their new text to the existing text
        let updatedTweet = tweetText.replacingCharacters(in: stringRange, with: text)

        // Checks that result is less than character limit
        return updatedTweet.count < characterLimit
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Change the text view's design properties
        let twitterColor = UIColor(red: 0.0, green: 0.6745, blue: 0.9333, alpha: 1.0)
        textView.layer.borderColor = twitterColor.cgColor
        textView.layer.cornerRadius = 15
    }
}
