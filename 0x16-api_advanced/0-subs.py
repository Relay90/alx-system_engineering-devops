#!/usr/bin/python3
"""Function to query subscribers on a given Reddit subreddit."""
import requests


def number_of_subscribers(subreddit):
    """Return the total number of subscribers on a given subreddit."""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json().get("data", {})
        subscribers = data.get("subscribers", 0)
        return subscribers
    elif response.status_code == 404:
        return 0
    else:
        # Handle other status codes gracefully
        print("Error: Unable to fetch data. Status code:", response.status_code)
        return None

# Tests
def test_existing_subreddit():
    subreddit = "redditdev"  # Example existing subreddit
    subscribers = number_of_subscribers(subreddit)
    expected_subscribers = 322577  # Replace with actual number of subscribers
    assert subscribers == expected_subscribers, f"Expected: {expected_subscribers}, Got: {subscribers}"
    print("Existing Subreddit Output Test: OK")

def test_nonexisting_subreddit():
    subreddit = "nonexistingsubreddit123456"  # Example non-existing subreddit
    subscribers = number_of_subscribers(subreddit)
    expected_subscribers = 0
    assert subscribers == expected_subscribers, f"Expected: {expected_subscribers}, Got: {subscribers}"
    print("Non-existing Subreddit Output Test: OK")

if __name__ == "__main__":
    test_existing_subreddit()
    test_nonexisting_subreddit()
