//
//  NetworkingValues+Exts.swift
//  SwiftHTTPExample
//
//  Created by Dylan Rafferty on 10/1/22.
//

import Foundation
import SwiftHTTP

struct BaseURL: NetworkingEnvironmentKey {
    static var defaultValue: URL = URL(fileURLWithPath: "")
}

extension NetworkingEnvironmentValues {
    var baseURL: URL {
        get { self[BaseURL.self] }
        set { self[BaseURL.self] = newValue }
    }
}
