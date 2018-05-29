import Foundation

class PhotoAlbum: Base {

    var name: String?{
        get { return (super.getAttributeInstance("name") as! JSONableString?)?.string }
        set(name) { super.setStringAttribute(withName: "name", name) }
    }
    var photos: [Photo]?{
        get { return (super.getAttributeInstance("photos") as! JSONableArray<Photo>?)?.array }
        set(photos) { super.setArrayAttribute(withName: "photos", photos) }
    }
    var previewPhotos: PreviewPhotos?{
        get { return super.getAttributeInstance("preview_photos") as? PreviewPhotos }
        set(previewPhotos) { super.setAttribute(withName: "preview_photos", previewPhotos) }
    }
    
    convenience init(_ s: String) {
        self.init()
        self.name = s
        self.displayedName = s
    }
    
    internal override func getAttributeCreationMethod(name: String) -> CreationMethod {
        switch name {
        case "name":
            return JSONableString().initAttributes
        case "photos":
            return JSONableArray<Photo>().initAttributes
        case "preview_photos":
            return PreviewPhotos().initAttributes
        default:
            return super.getAttributeCreationMethod(name: name)
        }
    }
}
