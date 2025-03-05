//
//  URLHelper.swift
//  NewsApp
//
//  Created by Yasin Erdemli on 5/3/25.
//

import Foundation

struct URLHelper {
    static private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        return components
    }

    static func topHeadlines(source: String) throws -> URL {
        var components = baseComponents
        components.path = "/v2/top-headlines"
        components.queryItems = [
            URLQueryItem(name: "sources", value: source),
            URLQueryItem(name: "apiKey", value: Constants.apiKey)
        ]
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }

    static func sources() throws -> URL {
        var components = baseComponents
        components.path = "/v2/sources"
        components.queryItems = [URLQueryItem(name: "apiKey", value: Constants.apiKey)]

        guard let url = components.url else {
            throw URLError(.badURL)
        }
        return url
    }
}
