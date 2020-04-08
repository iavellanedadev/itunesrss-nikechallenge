# itunesrss-nikechallenge
Fetching Music from iTunes' RSS Feed and Displaying them in Table View->Detailed View

Author: Iban Avellaneda

A small app built to fit the criteria provided by Nike that takes advantage of [iTunes' RSS Feed](https://rss.itunes.apple.com/en-us)

Created Image Loading singleton for efficient downloading and caching of images, incorporating NSOperation to cancel if image loading is unnecessary

Incorporated Unit Tests and UI Test for better code coverage.

Unit Tests: 
- Testing Business Logic and data properties using mock json
- Testing ViewModel with mock service class through dependency injection
- Testing Image caching with mock image url

UI Test:
- Testing the flow of the app with table cell tap and button tap

## Table of Contents

1. Goals
2. Build Guide

## 1. Goals
Create a simple application as modular, readable, scalable, and testable as possible.

## 2. Build Guide

macOS Catalina Version 10.15.3
Built in Xcode Version 11.4 (11E146).

Target: iOS 13.0

### Dependencies List:

None Allowed

### First-Party Frameworks used:

* UIKit
