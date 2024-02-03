import UIKit

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
        }
    }.resume()
}

getData(urlRequaest: "https://theaxolotlapi.netlify.app")

