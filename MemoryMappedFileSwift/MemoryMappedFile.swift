//
//  MemoryMappedFile.swift
//  MemoryMappedFileSwift
//
//  Created by Troy Stribling on 8/23/15.
//  Copyright (c) 2014 Troy Stribling. The MIT License (MIT).
//

import Foundation

public struct Stat {
    
}

public struct MemoryMappedFile {
    
    public let fd       : Int32
    private let cPath   : [CChar]
    
    public init?(path:String) {
        guard let cPath = path.cStringUsingEncoding(NSASCIIStringEncoding) else {
            return nil
        }
        self.cPath = cPath
        var fd = open(self.cPath, O_CREAT|O_EXCL|O_RDWR)
        if fd == -1 {
            fd = open(self.cPath, O_RDWR)
        }
        guard fd != -1 else {
            return nil
        }
        self.fd = fd
    }
    
    public func grow(size size:UInt16) throws {
        
    }
    
    public func fstat() -> Stat? {
        var statBuffer = UnsafeMutablePointer<stat>.alloc(1)
        let result = withUnsafeMutablePointer(statBuffer) {ptr -> Int32 in
            return fstat(self.fd, ptr)
        }
        return nil
    }
    
    public func close() {
        
    }
    
}
