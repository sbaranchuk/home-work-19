import UIKit
import CryptoKit

func getData(urlRequaest: String) {
    let urlRequaest = URL(string: urlRequaest)
    guard let url = urlRequaest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Error: \(String(describing: error?.localizedDescription ?? "could not retrieve description"))")
        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Server response code: \(response.statusCode)")
            guard let data = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
            print("Data: \(String(describing: dataAsString ?? "failed"))")
        }
    }.resume()
}

func md5Hash(_ source: String) -> String {
    return Insecure.MD5.hash(data: source.data(using: .utf8) ?? Data()).map { String(format: "%02hhx", $0) }.joined()
}

let ts = "1"
let privateKey = "ec640fc9432981da7b3ed0ce5214d8ea006331a2"
let publicKey = "b8b141d192b3f14b8217d4aa8aa3f17e"
let hash = md5Hash(ts + privateKey + publicKey)

var urlComponents = URLComponents(string: "https://gateway.marvel.com:443/v1/public/characters")
let queryItemTs = URLQueryItem(name: "ts", value: "1")
let queryItemApikey = URLQueryItem(name: "apikey", value: "b8b141d192b3f14b8217d4aa8aa3f17e")
let queryItemHash = URLQueryItem(name: "hash", value: hash)
urlComponents?.queryItems = [queryItemTs, queryItemApikey, queryItemHash]

getData(urlRequaest: urlComponents?.url?.absoluteString ?? "")
