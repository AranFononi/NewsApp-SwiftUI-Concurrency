import Foundation

typealias NewsArticles = [NewsArticle]

struct NewsArticleResponse: Decodable {
    let articles: NewsArticles
}

struct NewsArticle: Decodable, Identifiable {
    var id: String {
        author + title + publishedAt
    }
    let author: String
    let title: String
    let description: String
    let url: URL?
    let content: String
    let publishedAt: String
    let urlToImage: URL?

    enum CodingKeys: String, CodingKey {
        case author
        case title
        case description
        case url
        case content
        case publishedAt
        case urlToImage
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.author = (try? container.decode(String.self, forKey: .author)) ?? ""
        self.title = try container.decode(String.self, forKey: .title)
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        if let urlString = try? container.decode(String.self, forKey: .url), let url = URL(string: urlString) {
            self.url = url
        } else {
            self.url = nil
        }
        self.content = (try? container.decode(String.self, forKey: .content)) ?? ""
        self.publishedAt = try container.decode(String.self, forKey: .publishedAt)

        if let urlToImageString = try? container.decode(String.self, forKey: .urlToImage), let urlToImage = URL(string: urlToImageString) {
            self.urlToImage = urlToImage
        } else {
            self.urlToImage = nil
        }
    }
}
