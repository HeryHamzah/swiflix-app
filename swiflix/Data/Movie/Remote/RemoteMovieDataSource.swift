//
//  RemoteMovieDataSource.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 12/09/24.
//

import Foundation

class RemoteMovieDataSource: MovieDataSource {
    
    func getForYouList() async -> [MovieEntity] {
        let endpoint = "https://api.themoviedb.org/3/movie/popular"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let token = MovieConstants.ACCESS_TOKEN
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response: \(response)")
                return []
            }
            
            let decodeData = try JSONDecoder().decode(RemoteMovieListResultModel.self, from: data)
            
            return decodeData.results.map { $0.toEntity() }
        } catch {
            print("Error fetching data: \(error)")
            
            return []
        }
        
    }
    
    func getNowPlayingList() async -> [MovieEntity] {
        let endpoint = "https://api.themoviedb.org/3/movie/now_playing"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let token = MovieConstants.ACCESS_TOKEN
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response: \(response)")
                return []
            }
            
            let decodeData = try JSONDecoder().decode(RemoteMovieListResultModel.self, from: data)
            
            return decodeData.results.map { $0.toEntity() }
        } catch {
            print("Error fetching data: \(error)")
            
            return []
        }
    }
    
    func getUpcomingList() async -> [MovieEntity] {
        let endpoint = "https://api.themoviedb.org/3/movie/upcoming"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let token = MovieConstants.ACCESS_TOKEN
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response: \(response)")
                return []
            }
            
            let decodeData = try JSONDecoder().decode(RemoteMovieListResultModel.self, from: data)
            
            return decodeData.results.map { $0.toEntity() }
        } catch {
            print("Error fetching data: \(error)")
            
            return []
        }
    }
    
    func getCredits(id: Int) async -> [CastEntity] {
        let endpoint = "https://api.themoviedb.org/3/movie/\(id)/credits"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return []
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let token = MovieConstants.ACCESS_TOKEN
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response: \(response)")
                return []
            }
            
            let decodeData = try JSONDecoder().decode(RemoteCastResult.self, from: data)
            
            return decodeData.cast.prefix(6).map { $0.toEntity() }
        } catch {
            print("Error fetching data: \(error)")
            
            return []
        }
    }
    
    func getMovieDetail(id: Int) async -> MovieDetailEntity? {
        let endpoint = "https://api.themoviedb.org/3/movie/\(id)"
        
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let token = MovieConstants.ACCESS_TOKEN
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Invalid response: \(response)")
                return nil
            }
            
            let decodeData = try JSONDecoder().decode(RemoteMovieDetailModel.self, from: data)
            
            return decodeData.toEntity()
        } catch {
            print("Error fetching data: \(error)")
            
            return nil
        }
    }
 
    
}
