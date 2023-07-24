//
//  ApiCall.swift
//  Wheelock Hall
//
//  Created by Aidan Carey on 2023-07-18.
//

import Foundation

// class to get the dine on campus api
class ApiCall {
    func getApi(period periodNumber: Int, completion: @escaping (DineOnCampusAPI?) -> ()) {
        // get current date
        //let date = Date()
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyyMMdd" // set date format to iso
        //let dateString = dateFormatter.string(from: date) // convert date to string
        
        // example date that has a current menu (april 4, 2023)
        let dateString = "20230404"
        
        // TODO: dont hardcode periods
        // breakfast, lunch and dinner
        let periods = [
            "64bec33e0010cc05c2fcc8ec",
            "64bec33e0010cc05c2fcc8ee",
            "64bec33f0010cc05c2fcc8f5"
        ]
        
        let period = periods[periodNumber]
        
        // url of the api
        guard let url = URL(string: "https://api.dineoncampus.ca/v1/location/63b7353d92d6b47d412fff24/periods/\(period)?platform=0&date=\(dateString)") else { return }
        
        // fetch data from url
        URLSession.shared.dataTask(with: url) { data, response, error in
            // unwrap data, check for error in getting data
            guard let data = data, error == nil else {
                print("error: \(error!)")
                exit(EXIT_FAILURE)
            }
            
            // decode data into DineOnCampusAPI struct
            var api: DineOnCampusAPI?
            do {
                api = try JSONDecoder().decode(DineOnCampusAPI.self, from: data)
            } catch {
                api = nil
            }
            
            // escape the api object
            DispatchQueue.main.async {
                completion(api)
            }
        }
        .resume()
    }
}
