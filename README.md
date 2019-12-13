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

<img src='https://imgur.com/FIgAFiY.gif' title='Twitter Walkthrough' width='' alt='Twitter Initial Walkthrough' />

Here's a walkthrough of implemented bonus user stories:

<img src='https://imgur.com/Pz2orto.gif' title='Twitter Reload Walkthrough' width='' alt='Twitter Load Feed Walkthrough' />

### Notes
One issue that I was having was setting the Status Bar to be the same color as the Navigation Bar in the Navigation Controller. During the [Twitter - 3: Logout](https://www.youtube.com/watch?v=OmGebf_602k&list=PLrT2tZ9JRrf76ZFzfHPBNTUnmROWmxTYD&index=3) (at 2:30) the Navigation Bar gets its color changed, but the Status Bar's color didn't change in my project. What I had to do was set the Navigation Controller's Presentation to Full Screen (found in the Navigation Controller's Attributes inspector).

Another issue was getting the date formatting correct for pulling Twitter's 'created_at' option, and setting it properly.

