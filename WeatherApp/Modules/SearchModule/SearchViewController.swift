//  
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Daniil Konashenko on 20.12.2022.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
   
}

class SearchViewController: UIViewController {
    var presenter: SearchPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 138/255, green: 43/255, blue: 226/255, alpha: 1)
    }
}

//  MARK: EXTENSION

extension SearchViewController: SearchViewControllerProtocol {
    
}
