import Foundation


// STEP TWENTY TWO - Creating a new class : STEP THIRTY SEVEN - We have to mark our class as conforming to the protocol, "Encodable" -> This means that the Item Type is now able to encode itself into a Plist or a Json file. For the STEP in STEP THIRTY SIX to be able to work where we encode our Data and write it to the file path (I.E The document where our app lives in the user's phone), we need to conform our class to the protocol, "Encodable". : STEP FORTY FIVE - Since we're saying that our Item class is Encodable, we also need to say that it is, Decodable as well. So we conform to the "Decodable" protocol. Now since it will look silly writing, "class Item : Encodable, Decodable {" we can just shorten that and replace it with, "class Item : Codable {" meaning our class conforms to both the Encodable and Decodable protocols.
class Item : Codable {
    
    // STEP TWENTY THREE - Creating the properties for the class
    var title : String = ""
    var done : Bool = false
    
}
