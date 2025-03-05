

import Foundation
@MainActor
class NewsArticleListViewModel: ObservableObject {
    @Published var newsArticles: NewsArticles = []
    let service = Webservice()

    func getNewsBy(sourceId: String) async {
        do {
            let newsArticles = try await service.fetchNews(by: sourceId)
            self.newsArticles = newsArticles
        } catch {
            print(error)
        }
    }
}
