//
//  MemoryMap.swift
//  MemoryMappedFileSwift
//
//  Created by Troy Stribling on 8/23/15.
//  Copyright (c) 2014 Troy Stribling. The MIT License (MIT).
//

import Foundation

public struct MemoryMap {
    
    private let file : MemoryMappedFile
    
    public init(file:MemoryMappedFile) {
        self.file = file
    }
    
    
    public func map() -> UnsafeMutablePointer<Void> {
        return mmap(nil, 100, PROT_READ|PROT_WRITE, MAP_SHARED, file.fd, 0)
    }
    
    
}