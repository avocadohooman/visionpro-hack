import SwiftUI

struct ThemeService {
    static func getColor(for emotion: String) -> Color {
        switch emotion.lowercased() {
        case "joy":
            return Color(red: 255 / 255, green: 233 / 255, blue: 157 / 255)
        case "sadness":
            return Color(red: 128 / 255, green: 170 / 255, blue: 255 / 255)
        case "anger":
            return Color(red: 255 / 255, green: 152 / 255, blue: 128 / 255)
        case "fear":
            return Color(red: 170 / 255, green: 120 / 255, blue: 200 / 255)
        case "shame":
            return Color(red: 239 / 255, green: 182 / 255, blue: 195 / 255)
        default:
            return Color.gray // Default color for unknown emotions
        }
    }
}
