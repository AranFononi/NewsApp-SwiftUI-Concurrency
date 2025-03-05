

import SwiftUI

struct NewsListScreen: View {
    @StateObject private var viewModel = NewsArticleListViewModel()
    let newsSource: NewsSource
    var body: some View {
        List(viewModel.newsArticles) { newsArticle in
                NewsArticleCell(newsArticle: newsArticle)
        }
        .listStyle(.plain)
        .task {
            await viewModel.getNewsBy(sourceId: newsSource.id)
        }
        .navigationTitle(newsSource.name)
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen(newsSource: .example)
    }
}

struct NewsArticleCell: View {
    let newsArticle: NewsArticle

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: newsArticle.urlToImage) { image in
                image.resizable()
                    .frame(maxWidth: 100, maxHeight: 100)
            } placeholder: {
                ProgressView("Loading...")
                    .frame(maxWidth: 100, maxHeight: 100)
            }

            VStack {
                Text(newsArticle.title)
                    .fontWeight(.bold)
                Text(newsArticle.description)
            }
        }
    }
}
