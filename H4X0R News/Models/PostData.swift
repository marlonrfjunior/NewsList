//
//  PostData.swift
//  H4X0R News
//
//  Created by Marlon Junior on 05/05/22.
//

import Foundation

struct Results : Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
