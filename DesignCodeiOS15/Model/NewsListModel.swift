// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let code: Int
    let data: [Datum]
    let businessCode, message: String
    let total: Int
}

// MARK: - Datum
struct Datum: Codable {
    let information: Information
    let informationColumns: InformationColumns
    let informationRelease: InformationRelease
    let informationStat: InformationStat
    let informationIcons: [JSONAny]
    let informationTags: JSONNull?
    let isLike, isStore, isTrack: String

    enum CodingKeys: String, CodingKey {
        case information, informationColumns, informationRelease
        case informationStat = "InformationStat"
        case informationIcons, informationTags, isLike, isStore, isTrack
    }
}

// MARK: - Information
struct Information: Codable {
    let inforCode, inforTitle, inforSubTitle, inforType: String
    let summary: String
    let inforURL: String
    let urlTitle: String
    let isBold, isRed: Is
    let source: Source
    let sourceURL, author, iconURL: String
    let isLimit: Is
    let isStatic: String
    
    let deptCode, deptName, staticTime,releaseTime,createTime,updateTime: String
    let createUserCode: AteUserCode
    let createUserName: AteUserName
    
    let updateUserCode: AteUserCode
    let updateUserName: AteUserName
    

    enum CodingKeys: String, CodingKey {
        case inforCode, inforTitle, inforSubTitle, inforType, summary
        case inforURL = "inforUrl"
        case urlTitle, isBold, isRed, source
        case sourceURL = "sourceUrl"
        case author
        case iconURL = "iconUrl"
        case isLimit, isStatic, staticTime, releaseTime, deptCode, deptName, createUserCode, createUserName, createTime, updateUserCode, updateUserName, updateTime
    }
}

enum AteUserCode: String, Codable {
    case the0E8C5F2FAf58856C5E097E2Dcf5F1A62 = "0e8c5f2f-af58-856c-5e09-7e2dcf5f1A62"
}

enum AteUserName: String, Codable {
    case 测试用户 = "测试用户"
}

enum Is: String, Codable {
    case n = "N"
}

enum Source: String, Codable {
    case 四川省企业发展促进中心 = "四川省企业发展促进中心"
    case 河北省中小企业公共服务平台 = "河北省中小企业公共服务平台"
    case 浙江省中小企业服务中心 = "浙江省中小企业服务中心"
}

// MARK: - InformationColumns
struct InformationColumns: Codable {
    let parentCode, columnCode, columnName, columnEnName: String
    let isLeaf, isValid, isCheck, isPic: String
    let showType, columnURL, columnPic: String
    let sortNo: Int
    let remark, createUserCode, createUserName,createTime,updateTime: String
    
    let updateUserCode, updateUserName: String


    enum CodingKeys: String, CodingKey {
        case parentCode, columnCode, columnName, columnEnName, isLeaf, isValid, isCheck, isPic, showType
        case columnURL = "columnUrl"
        case columnPic, sortNo, remark, createUserCode, createUserName, createTime, updateUserCode, updateUserName, updateTime
    }
}

// MARK: - InformationRelease
struct InformationRelease: Codable {
    let inforCode, columnCode, businessCode, releaseUserCode: String
    let releaseUserName: String
    let releaseTime: String
    let releaseStatus, isTop: String
    let sortNo: Int
    let createUserCode, createUserName: String
    let createTime: String
    let updateUserCode, updateUserName: String
    let updateTime: String
}

// MARK: - InformationStat
struct InformationStat: Codable {
    let inforCode: String
    let hits, likes: Int
    let createUserCode, createUserName: String
    let createTime: String
    let updateUserCode, updateUserName: String
    let updateTime: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
