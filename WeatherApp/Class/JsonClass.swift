//
//  JsonClass.swift
//  WeatherApp
//
//  Created by Harish Gangula on 19/01/18.
//  Copyright © 2018 Anuja Deshmukh. All rights reserved.
//

import UIKit

protocol JsonObjectDelegate: class {
    func didFinishTask(isSuccess: Bool, resultSet:Any, type:String)
}
class JsonClass: NSObject {
weak var delegate:JsonObjectDelegate?
    var type = String()
    var method = String()
    
    
    func getJsonFromUrl(urlStr:String){
     //   let urlStr = String(format: Constants.URLS.baseUrl,"4163971")

        guard let url = URL.init(string: urlStr) else{return}
        let request = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
                print(error!.localizedDescription)
                OperationQueue.main.addOperation({
                    //                       let responce = JSON(data!)
                    
                    self.delegate?.didFinishTask(isSuccess: false, resultSet: error!.localizedDescription, type: self.type)
                    
                })
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    //print(json.value(forKey: "main")!)
                    
                    print(json)
                    OperationQueue.main.addOperation({
//                       let responce = JSON(data!)
                        
                        self.delegate?.didFinishTask(isSuccess: true, resultSet: data!, type: self.type)

                    })
                    
                }catch let error as NSError{
                    print(error)
                    
                }
            }
        }).resume()
 
}
    
}
// Class City Info
class CityInfo: NSObject {
    var humidity :String?
     var pressure: String?
    var temp: String?
    var name: String?
    var id: String?
    var sunrise : String?
    var sunset : String?
    var country : String?

    var temp_max : String?
    var temp_min : String?

}
//Responce 
//{"coord":{"lon":-0.13,"lat":51.51},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":0.8,"pressure":1009,"humidity":90,"temp_min":-2,"temp_max":3},"visibility":10000,"wind":{"speed":5.7,"deg":250},"clouds":{"all":0},"dt":1516344600,"sys":{"type":1,"id":5091,"message":0.008,"country":"GB","sunrise":1516348528,"sunset":1516379259},"id":2643743,"name":"London","cod":200}

