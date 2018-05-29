import Foundation

class Reset: Base {

    var username: String?{
        get { return (super.getAttributeInstance("username") as! JSONableString?)?.string }
        set(login) { super.setStringAttribute(withName: "username", login) }
    }
    var response: String?{
        get { return (super.getAttributeInstance("response") as! JSONableString?)?.string }
        set(response) { super.setStringAttribute(withName: "response", response) }
    }
    
    internal override func getAttributeCreationMethod(name: String) -> CreationMethod {
        switch name {
        case "username", "response":
            return JSONableString().initAttributes
        default:
            return super.getAttributeCreationMethod(name: name)
        }
    }
    
    public required init() {
        super.init()
    }

    init(username: String) {
        super.init()
        self.username = username
    }

}
