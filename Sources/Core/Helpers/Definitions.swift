//
//  Definitions.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import SwiftyJSON

// Handler
typealias Completion = () -> Void
typealias CompletionSuccess = (_ success: Bool) -> Void
typealias CompletionSuccessBands = (_ success: Bool, _ bands: [Band]?) -> Void
typealias CompletionSuccessJson = (_ success: Bool, _ json: JSON?) -> Void
