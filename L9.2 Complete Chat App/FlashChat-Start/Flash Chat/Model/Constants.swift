//
//  Constants.swift
//  Lab9-6614110014
//
//  Created by MII-MAC-21 on 6/2/2568 BE.
//  Copyright © 2568 BE Angela Yu. All rights reserved.
//

struct K {
    static let appName = "⚡ FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
