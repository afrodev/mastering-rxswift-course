//
//  ViewController.swift
//  S10-GoodWeather
//
//  Created by Humberto Vieira on 02/05/19.
//  Copyright © 2019 Humberto Vieira. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cityNameTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map({ self.cityNameTextField.text })
            .subscribe(onNext: { (city) in
                if let city = city {
                    if city.isEmpty {
                        self.displayWeather(nil)
                    } else {
                        self.fetchWeather(by: city)
                    }
                }

            }).disposed(by: disposeBag)
    }

    private func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL.urlForWeatherAPI(city: cityEncoded) else {
                return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        let search = URLRequest.load(resource: resource)
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn(WeatherResult.empty)
            .asDriver(onErrorJustReturn: WeatherResult.empty)
        
        search.map( { "\($0.main.temp) ºF" } )
            .drive(self.temperatureLabel.rx.text)
            .disposed(by: disposeBag)
        
        search.map( { "\($0.main.humidity) 💦 " })
            .drive(self.humidityLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func displayWeather(_ weather: Weather?) {
        if let weather = weather {
            self.temperatureLabel.text = "\(weather.temp) ºF"
            self.humidityLabel.text = "\(weather.humidity) 💦 "
        } else {
            self.temperatureLabel.text = "🙈"
            self.humidityLabel.text = "ø"
        }
    }

}

