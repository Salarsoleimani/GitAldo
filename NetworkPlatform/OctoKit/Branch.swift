//
//  Branch.swift
//  NetworkPlatform
//
//  Created by Salar Soleimani on 2020-04-25.
//  Copyright © 2020 BeKSaS. All rights reserved.
//

import Foundation
import RequestKit
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

// MARK: model
public struct Commit: Codable {
  public let sha: String
  public let url: String
}
open class Branch: Codable {
    open var name: String
    open var commit: Commit
    open var protected: Bool
}
