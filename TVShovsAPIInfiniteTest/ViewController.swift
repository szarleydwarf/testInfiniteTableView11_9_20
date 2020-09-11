//
//  ViewController.swift
//  TVShovsAPIInfiniteTest
//
//  Created by The App Experts on 11/09/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrayOfShows:[Show] = []
    let apiUrl:String = "https://www.episodate.com/api/most-popular?page=1"
    let apiShowList:String = "most-popular"
    let apiShowPage:String = "?page="
    let apiShowDetails:String = "show-details?q="
    let showTableViewCellString = "ShowTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: showTableViewCellString, bundle: nil), forCellReuseIdentifier: showTableViewCellString)
        
        getShows()
    }
    
    func getShows() {
        let session = URLSession.shared
        guard let url = URL(string: self.apiUrl) else {return}
//        "https://learnappmaking.com/ex/users.json")!

        let task = session.dataTask(with: url) { data, response, error in

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let json = try? JSONDecoder().decode(ShowResults.self, from: data!)
                //JSONSerialization.jsonObject(with: data!, options: [])
                self.arrayOfShows = json!.tvShows
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }

        task.resume()

//        guard let url = URL(string: self.apiUrl) else {return}
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            print("data>\(data)")
////            print("resp>\(response)")
//            print("error>\(error)")
//            guard let data = data else {return}
//
//            let results = try? JSONDecoder().decode(ShowResults.self, from: data)
//            print("Results> \(results?.tvShows)")
//            self.arrayOfShows = results?.tvShows ?? []
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.showTableViewCellString, for: indexPath) as! ShowTableViewCell
        cell.showTitleLabel.text = self.arrayOfShows[indexPath.row].name
//        var date =
        cell.runingDurationLabel.text = getDate(index: indexPath.row)
        
        return cell
    }
    
    func getDate(index:Int) -> String {
        var date = self.arrayOfShows[index].startDate
        let end = self.arrayOfShows[index].endDate
        date = date + " - "
        if end == "null" || end.isEmpty || end == "" {
            date = date + self.arrayOfShows[index].status
        } else {
            date = date + end
        }
        return date
    }
}
