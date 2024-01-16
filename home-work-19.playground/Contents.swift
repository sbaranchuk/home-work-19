import UIKit

func getData(urlRequaest: String) {
    let urlRequaest = URL(string: urlRequaest)
    guard let url = urlRequaest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {

        } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            guard let tada = data else { return }
            let dataAsString = String(data: data, encoding: .utf8)
        }
    }.resume()
}
