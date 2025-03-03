

import Foundation

class NewsArticleListViewModel: ObservableObject {
    
    @Published var newsArticles = [NewsArticleViewModel]()
    
    func getNewsBy(sourceId: String) async {
        do {
            let newsArticles = try await Webservice().fetchNewsAsync(by: sourceId, url: Constants.Urls.topHeadlines(by: sourceId))
            DispatchQueue.main.async {
                self.newsArticles = newsArticles.map(NewsArticleViewModel.init)
            }
        } catch {
            print(error)
        }
        
    }
    
}

struct NewsArticleViewModel {
    
    let id = UUID()
    fileprivate let newsArticle: NewsArticle
    
    var title: String {
        newsArticle.title
    }
    
    var description: String {
        newsArticle.description ?? ""
    }
    
    var author: String {
        newsArticle.author ?? ""
    }
    
    var urlToImage: URL? {
        URL(string: newsArticle.urlToImage ?? "")
    }
    
}
