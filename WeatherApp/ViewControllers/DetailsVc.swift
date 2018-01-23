//
//  DetailsVc.swift
//  WeatherApp
//
//  Created by Harish Gangula on 19/01/18.
//  Copyright © 2018 Anuja Deshmukh. All rights reserved.
//

import UIKit

class DetailsVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    //,UICollectionViewDelegateFlowLayout
    var CityObj = CityInfo()
    override func viewDidLoad() {
        super.viewDidLoad()
          print(CityObj)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath as IndexPath) as! DetailsCollectionViewCell
        if  indexPath.row==0
        {
        cell.lblHeading.text = "City Name"
        cell.lblValue.text = CityObj.name
        }
        if  indexPath.row==1
        {
            cell.lblHeading.text = "City Id"
            cell.lblValue.text = CityObj.id
        }
        if  indexPath.row==2
        {
            cell.lblHeading.text = "Temprature"
            cell.lblValue.text = CityObj.temp
            
        }
        if  indexPath.row==3
        {
            cell.lblHeading.text = "Humidity"
            cell.lblValue.text = CityObj.humidity
            
        }
        if  indexPath.row==4
        {
            cell.lblHeading.text = "Pressure"
            cell.lblValue.text = CityObj.pressure
            
        }
        if  indexPath.row==5
        {
            cell.lblHeading.text = "Sunrise"
            cell.lblValue.text = CityObj.sunrise
            
        }
        if  indexPath.row==6
        {
            cell.lblHeading.text = "Sunset"
            cell.lblValue.text = CityObj.sunset
        
            
        }
        if  indexPath.row==7
        {
            cell.lblHeading.text = "Temprature Min"
            cell.lblValue.text = CityObj.temp_min
            
        }
        if  indexPath.row==8
        {
            cell.lblHeading.text = "Temprature Max"
            cell.lblValue.text = CityObj.temp_max
            
        }
        if  indexPath.row==9
        {
            cell.lblHeading.text = "Country"
            cell.lblValue.text = CityObj.country
            
        }
        return cell
        
    }
    @IBAction func btnBackOnclick(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)

    }
    //    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 128)
//
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
