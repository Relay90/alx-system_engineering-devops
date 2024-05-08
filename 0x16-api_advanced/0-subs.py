#!/usr/bin/python3
"""
Contains the number_of_subscribers function
"""

import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit."""
    if subreddit is None or not isinstance(subreddit, str):
        return 0
    response = requests.get(f'http://www.reddit.com/r/{subreddit}/about.json',
                            headers={'User-Agent': '0x16-api_advanced:project:v1.0.0 (by /u/firdaus_cartoon_jr)'}).json()
    subscribers = response.get("data", {}).get("subscribers", 0)
    return subscribers


if __name__ == "__main__":
    pass  # You can add test code here if needed
