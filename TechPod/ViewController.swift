//
//  ViewController.swift
//  TechPod
//
//  Created by チップまん on 2020/09/19.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tabel: UITableView!
    
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabel.dataSource = self
        
        tabel.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        fileNameArray = ["caaon", "elise", "aria"]
        
        imageNameArray = ["Pacheldel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource:
            fileNameArray[indexPath.row],ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
    }

}

