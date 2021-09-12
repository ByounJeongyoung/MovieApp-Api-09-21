//
//  ViewController.swift
//  MovieApp
//
//  Created by Young on 2021/09/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //값 잡아놓기 -> 네트워크 호출
    var movieModel: MovieModel?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var movieTableVieww: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableVieww.delegate = self //이벤트,크기조절
        movieTableVieww.dataSource = self
        searchBar.delegate = self
        
        requestMoviewAPI()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieModel?.results.count ?? 0
    }
    
    //어떤 쎌을 사용할것인가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        
        
        cell.titleLabel.text = self.movieModel?.results[indexPath.row].trackName
        cell.descriptionLabel.text = self.movieModel?.results[indexPath.row].shortDescription
        cell.priceLabel.text = self.movieModel?.results[indexPath.row].totalPrice
//
//        let currency = self.movieModel?.results[indexPath.row].currency ?? ""
//        let price = self.movieModel?.results[indexPath.row].trackPrice.description ?? ""
//
//        //옵셔널끼리 덧셈 물가
//        cell.priceLabel.text = "\(currency) + \(price)"
//
        
        return cell
    }
    
    @IBAction func moveButton(_ sender: UIBarButtonItem) {
    }
    
    func requestMoviewAPI() {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        var components = URLComponents(string: "https://itunes.apple.com/search?")
        let term = URLQueryItem(name: "term", value: "marvel")
        let media = URLQueryItem(name: "media", value: "movie")
        
        //queryItems ==  [URLQueryItem]?
        components?.queryItems = [term, media]
        guard let url = components?.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            
            print((response as! HTTPURLResponse).statusCode)
            if let hasData = data {
                
                do {
                    try
                        //decode => throw형식임 => try!
                        self.movieModel =  JSONDecoder().decode(MovieModel.self , from: hasData)
                    
                    print(self.movieModel ?? "no data")
                    DispatchQueue.main.async {
                        self.movieTableVieww.reloadData()
                    }
                } catch  {
                    print(error)
                }
            }
        }
        task.resume()//실행한다
        session.finishTasksAndInvalidate()
        
    }
}

extension ViewController : UISearchBarDelegate{
    //이벤트
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

