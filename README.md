# Twitter - Part II

This is a basic twitter app to view, compose, favorite, and retweet tweets.

Time spent: **3.4** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can compose a tweet. (4pts)
- [x] User can favorite a tweet. (4pts)
- [x] User can retweet a tweet. (2pts)

The following **bonus** features are implemented:

- [ ] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 140) (2pts)
- [ ] User can view their profile in a profile tab. (3pts)
- [ ] User sees embedded images in tweet if available. (3pts)

## Video Walkthrough

Here's a walkthrough of tweeting:

<img src='https://imgur.com/YfSjlqX.gif' title='Favoriting and Retweeting' width='250px' alt='Favoriting and Retweeting' />

Here's a walkthrough of favoriting and retweeting:

<img src='https://imgur.com/Ixn9OvE.gif' title='Favoriting and Retweeting' width='250px' alt='Favoriting and Retweeting' />

### Notes
An issue I had was getting the Tweet Table View Controller to refresh and update after composing a tweet. The tweet would not immediately show up after having created it. This issue turned out to be the same issue that I had earlier, in changing the Navigation Controller's Presentation to Full Screen. Once that was changed, the Twitter Feed was automatically getting updated after composing said tweet.

# Project 3 - *Twitter*

**Twitter** is a basic twitter app to read your tweets.

Time spent: **6.7** hours spent in total (required user stories)
Time spent: **8.3** hours spent in total (bonus user stories)

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen. (1pt)
- [x] User can log in. (1pt)
- [x] User can log out. (1pt)
- [x] User stays logged in across restarts. (1pt)
- [x] User can view tweets with the user profile picture, username, and tweet text. (6pts)

The following **bonus** features are implemented:

- [x] User can pull to refresh. (1pt)
- [x] User can load past tweets infinitely. (2pts)

## Video Walkthrough

Here's a walkthrough of implemented required user stories:

<img src='https://imgur.com/FIgAFiY.gif' title='Twitter Walkthrough' width='250px' alt='Twitter Initial Walkthrough' />

Here's a walkthrough of implemented bonus user stories:

+<img src="/gifs/twitter_bonus_user_stories.gif?raw=true" width="250px">

### Notes
One issue that I was having was setting the Status Bar to be the same color as the Navigation Bar in the Navigation Controller. During the [Twitter - 3: Logout](https://www.youtube.com/watch?v=OmGebf_602k&list=PLrT2tZ9JRrf76ZFzfHPBNTUnmROWmxTYD&index=3) (at 2:30) the Navigation Bar gets its color changed, but the Status Bar's color didn't change in my project. What I had to do was set the Navigation Controller's Presentation to Full Screen (found in the Navigation Controller's Attributes inspector).

Another issue was getting the date formatting correct for pulling Twitter's 'created_at' option, and setting it properly.

