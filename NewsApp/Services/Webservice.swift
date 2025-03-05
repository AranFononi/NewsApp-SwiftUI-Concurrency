
import Foundation

actor Webservice {
    let decoder = JSONDecoder()
    func fetchSources() async throws -> NewsSources {
        let url = try URLHelper.sources()
        let (data, _) = try await URLSession.shared.data(from: url)
        let newsSourceResponse = try decoder.decode(NewsSourceResponse.self, from: data)

        return newsSourceResponse.sources
    }

    func fetchNews(by sourceID: String) async throws -> NewsArticles {
        let url = try URLHelper.topHeadlines(source: sourceID)
        let (data, _) = try await URLSession.shared.data(from: url)
        let newsArticlesResponse = try decoder.decode(NewsArticleResponse.self, from: data)
        return newsArticlesResponse.articles
    }
}
