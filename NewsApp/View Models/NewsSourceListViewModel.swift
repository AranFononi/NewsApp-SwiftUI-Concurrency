

import Foundation
@MainActor
class NewsSourceListViewModel: ObservableObject {
    @Published var newsSources: NewsSources = []
    let service = Webservice()

    func getSources() async {
        do {
            let newsSources = try await service.fetchSources()
            self.newsSources = newsSources
        } catch {
            print(error)
        }
    }
}
