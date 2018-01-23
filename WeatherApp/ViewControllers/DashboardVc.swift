//
//  DashboardVc.swift
//  WeatherApp
//
//  Created by Harish Gangula on 19/01/18.
//  Copyright © 2018 Anuja Deshmukh. All rights reserved.
//

import UIKit

/////// Structure
// controller -> calles model city model -> city model will call -> Api class
// controller <- city model returns response <- Api  returns response




class DashboardVc: UIViewController,UITableViewDelegate, UITableViewDataSource, JsonObjectDelegate {
    
    @IBOutlet weak var tblCityInfo: UITableView!
    let jsonObj = JsonClass()
    var CityObj = CityInfo()
    var count : NSInteger = 0
    var arrCityInfo :NSMutableArray = []
    var arrId :NSArray = []
    var hud = MBProgressHUD()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnRefresh(_ sender: Any) {
        fetchData()
    }
    
    func fetchData()
    {
        // To fetch data from API
        count = 0
        arrCityInfo = []
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        
        hud.label.text = "Please wait data is loading..."
        arrId = ["4163971","2147714","2174003"]
        jsonObj.delegate=self
        
        let urlStr = String(format: Constants.URLS.baseUrl,arrId[count] as! String)
        jsonObj.getJsonFromUrl(urlStr: urlStr)
    }
    
    //Jsondelegate method
    func didFinishTask(isSuccess: Bool, resultSet: Any, type: String) {
        if isSuccess{
            print("did",resultSet as Any)
             let responce = JSON(resultSet)
           CityObj = CityInfo()
            //Key and values fron dictionary
        CityObj.humidity = responce["main"]["humidity"].stringValue
        CityObj.temp = responce["main"]["temp"].stringValue
        CityObj.temp_max = responce["main"]["temp_max"].stringValue
        CityObj.temp_min = responce["main"]["temp_min"].stringValue


        CityObj.name = responce["name"].stringValue
        CityObj.id = responce["id"].stringValue

        CityObj.sunrise = responce["sys"]["sunrise"].stringValue
        CityObj.sunset = responce["sys"]["sunset"].stringValue
        CityObj.country = responce["sys"]["country"].stringValue

        CityObj.pressure = responce["main"]["pressure"].stringValue
         arrCityInfo.add(CityObj)
            print("arrcityinfo",arrCityInfo)
            count = count+1
            if(count<3)
            {
                jsonObj.delegate=self
                
                let urlStr = String(format: Constants.URLS.baseUrl,arrId[count] as! String)
                jsonObj.getJsonFromUrl(urlStr: urlStr)
                
            }
            if(count == 3)
            {
           tblCityInfo.reloadData()
                
              
            }
        }
          
        else{
            print(resultSet as Any)
            let alert = UIAlertController(title: "Alert", message: "Please Check Your Network connection", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
          hud.hide(animated: true)
    }
    

   
   
    
    
    //Table delegate and data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrCityInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherDetailsCell",
                                                 for: indexPath) as! WeatherDetailsCell
        CityObj = CityInfo()
        CityObj = arrCityInfo[indexPath.row] as! CityInfo
        cell.lblNameCity.text = CityObj.name
        cell.lblTemp.text = CityObj.temp
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //click functionality
        
            CityObj = CityInfo()
            CityObj = arrCityInfo[indexPath.row] as! CityInfo
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVc") as! DetailsVc
            svc.CityObj = CityObj
            self.navigationController?.pushViewController(svc, animated: true)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


