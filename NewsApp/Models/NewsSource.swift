

import Foundation

typealias NewsSources = [NewsSource]

struct NewsSourceResponse: Decodable {
    let sources: NewsSources
}

struct NewsSource: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String

    static let example = NewsSource(id: "abc-news", name: "ABC News", description: "This is ABC news")
}
