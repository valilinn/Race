//
//  StatsViewController.swift
//  Race
//
//  Created by Валентина Лінчук on 09/07/2023.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var players: [Stats] = [
        //        Stats(imageOfWinners: UIImage(named: "0"), statsImage: .withImage, statsNumber: 01, playerName: "Britney Spears", points: 1024),
        //        Stats(imageOfWinners: UIImage(named: "1"), statsImage: .withImage, statsNumber: 02, playerName: "Lana Del Ray", points: 1000),
        //        Stats(imageOfWinners: UIImage(named: "2"), statsImage: .withImage, statsNumber: 03, playerName: "Adele", points: 999),
        //        Stats(statsImage: .withoutImage, statsNumber: 04, playerName: "Beyonce", points: 888),
        //        Stats(statsImage: .withoutImage, statsNumber: 05, playerName: "Enej", points: 777),
        Stats(name: "Beyonce", points: 888),
        Stats(name: "Enej", points: 777),
        Stats(name: "Britney Spears", points: 1024),
        Stats(name: "Lana Del Rey", points: 1000),
        Stats(name: "Adele", points: 999)
    ].sorted {$0.points > $1.points}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let winnersNib = UINib(nibName: "WinnersStatsTableViewCell", bundle: Bundle.main)
        tableView.register(winnersNib, forCellReuseIdentifier: "winnersStatsCell")
        
        let othersNib = UINib(nibName: "OtherStatsTableViewCell", bundle: Bundle.main)
        tableView.register(othersNib, forCellReuseIdentifier: "otherStatsCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addImages()
    }

    
    func addImages() {
        for i in 0..<players.count {
            switch i {
            case 0:
                players[i].image = UIImage(named: "0")
            case 1:
                players[i].image = UIImage(named: "1")
            case 2:
                players[i].image = UIImage(named: "2")
            default:
                players[i].statsNumber = i + 1
            }
        }
    }
}




extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
    
        if index <= 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "winnersStatsCell", for: indexPath) as? WinnersStatsTableViewCell else { return UITableViewCell() }
            cell.winnerImageView.image = players[index].image
            cell.playerNameLabel.text = players[index].name
            cell.pointsLabel.text = String(players[index].points)

            // cell.delegate = self
 
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherStatsCell", for: indexPath) as? OtherStatsTableViewCell else { return UITableViewCell() }
            cell.playerNumber.text = String(players[index].statsNumber!)
            cell.playerNameLabel.text = players[index].name
            cell.pointsLabel.text = String(players[index].points)
          return cell
        }
        
        
    }
}
