
import Foundation

struct Constants {
    
    struct Urls {
        
        static func topHeadlines(by source: String) -> URL? {
            return URL(string: "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=YOURAPIKEY")
        }
                
        static let sources: URL? = URL(string: "https://newsapi.org/v2/sources?apiKey=YOURAPIKEY")
    }
    
}
