import Foundation

@available(iOS 15.0, *)
struct NotionAPIGateway {
    let secretKey: String
    let baseUrl = "https://api.notion.com/v1"
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }
    
    private func request(_ notionRequest: NotionRequest) async throws -> Data {
        print("URL: " + "\(baseUrl)\(notionRequest.endpointPath)")
        let request = URLRequest(from: notionRequest, baseUrl: baseUrl, secretKey: secretKey)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    
    func retrieveDatabase(withId id: String) async throws -> NotionDatabase {
        let data = try await request(.retrieveDatabase(databaseId: id))
        let database = try decoder.decode(NotionDatabase.self, from: data)
        return database
    }
    
    func queryDatabase(withId id: String) async throws -> [NotionPage] {
        let data = try await request(.queryDatabase(databaseId: id))
        print(String(data: data, encoding: .utf8)!)
        let list = try decoder.decode(NotionPageList.self, from: data)
        return list.results
    }
}

extension URLRequest {
    init(from notionRequest: NotionRequest, baseUrl: String, secretKey: String) {
        let url = URL(string: "\(baseUrl)\(notionRequest.endpointPath)")!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Authorization": "Bearer \(secretKey)",
            "Notion-Version": "2021-05-13"
        ]
        request.httpMethod = notionRequest.request.rawValue.uppercased()
        self = request
    }
}
