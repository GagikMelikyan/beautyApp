//
//  AboutViewController.swift
//  Beauty App
//
//  Created by User on 1/24/20.
//  Copyright © 2020 NTIC. All rights reserved.
//

import UIKit
import MapKit

struct WorkingTime {
    var day: String
    var time: String
   
}

class AboutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var aboutTextLabel: UILabel!
    
    @IBOutlet weak var map: MKMapView!
        
    private var workingDays = [WorkingTime(day: "Lundi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Mardi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Mercredi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Jeudi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Vendredi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Samedi", time: "09:00 - 18:00"),
                                WorkingTime(day: "Dimanche", time: "Fermé")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCells(names: [WorkingDayCell.id])
        
        let location = MKPointAnnotation()
//        location.title = "L"
        location.coordinate = CLLocationCoordinate2D(latitude: 48.865789, longitude: 2.3905073)
        let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
        map.addAnnotation(location)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WorkingDayCell.id, for: indexPath) as! WorkingDayCell
        cell.dayLabel.text = workingDays[indexPath.row].day
        cell.workingTimeLabel.text = workingDays[indexPath.row].time
        if indexPath.row == workingDays.count - 1 {
            cell.workingTimeLabel.textColor = .lightGray
        }
        return cell
    }
    
}
