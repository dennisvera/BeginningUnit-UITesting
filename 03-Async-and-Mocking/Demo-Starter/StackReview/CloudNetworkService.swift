//
//  CloudNetworkService.swift
//  StackReview
//
//  Created by Dennis Vera on 7/1/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation

public protocol CloudNetworkService {
    
    func login(userName: String, password: String, success: ()->(), failure: (Error)->())
    
    func loadPancakeHouses(success: @escaping ([PancakeHouse])->(),
                           failure: @escaping (CloudNetworkError)->())
}
