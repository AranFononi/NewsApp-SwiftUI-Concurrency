

import SwiftUI

struct NewsSourceListScreen: View {
    @StateObject private var viewModel = NewsSourceListViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.newsSources) { newsSource in
                NavigationLink(value: newsSource) {
                    NewsSourceCell(newsSource: newsSource)
                }
            }
            .listStyle(.plain)
            .refreshable {
                await viewModel.getSources()
            }
            .navigationDestination(for: NewsSource.self) { source in
                NewsListScreen(newsSource: source)
            }
            .navigationTitle("News Sources")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("refresh", systemImage: "arrow.clockwise.circle") {
                        Task {
                            await viewModel.getSources()
                        }
                    }
                }
            }
            .task {
                await viewModel.getSources()
            }
        }
    }
}

struct NewsSourceListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsSourceListScreen()
    }
}

struct NewsSourceCell: View {
    let newsSource: NewsSource

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(newsSource.name)
                .font(.headline)
            Text(newsSource.description)
        }
    }
}
