import SwiftUI
import Combine

struct Body: Codable {
    let email: String?
    let password: String?
}

struct Response: Codable {
    let data: Data
}

struct Data: Codable {
    let access_token: String?
    let token_type: String?
    let refresh_token: String?
    let expires_in: Int?
}

class NetworkingViewModel: ObservableObject {

    let url  = "https://todolist.dev2.cogniteq.com/api/v1/sign-in"
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

//Дженерики для любой боди.
        // 4 get-post-delete-put
    func postData<T: Codable>(body: T) {
        guard let url = URL(string: url) else {return}

        let finalData = try? encoder.encode(body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let data = data{
                    let result = try? self.decoder.decode(Response.self, from: data)
                    print(result ?? "Data here")
                } else {
                    print("No data")
                }
            } catch (let error) {
                print(String(describing: error))
                print("error")
                print(error.localizedDescription)

            }
        } .resume()
    }
}
