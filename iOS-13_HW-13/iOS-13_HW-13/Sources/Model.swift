import UIKit
import SnapKit

struct Setting: Hashable {
    var name: String
    var image: UIImage
    var cellType: TypeOfAccessories
    var statusText: String = ""
}

enum TypeOfAccessories {
    case disclosureIndicator
    case switchButton
}

extension Setting {
    static var newSetting: [[Setting]] = [
        // Первое отделение
        [Setting(name: "Авиарежим", image: UIImage(named: "Авиарежим") ?? UIImage.remove, cellType: .switchButton),
         Setting(name: "Wi-Fi", image: UIImage(named: "Wi-Fi") ?? UIImage.remove, cellType: .disclosureIndicator, statusText: "Не подключен"),
         Setting(name: "Bluetooth", image: UIImage(named: "Bluetooth") ?? UIImage.remove, cellType: .disclosureIndicator, statusText: "Вкл."),
         Setting(name: "Сотовая связь", image: UIImage(named: "Сотовая связь") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Режим модема", image: UIImage(named: "Режим модема") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "VPN", image: UIImage(named: "VPN") ?? UIImage.remove, cellType: .disclosureIndicator, statusText: "Не подключен")],
        
        // Второе отделение
        [Setting(name: "Уведомления", image: UIImage(named: "Уведомления") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Звуки, тактильные сигналы", image: UIImage(named: "Звук") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Фокусирование", image: UIImage(named: "Фокусирование") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Экранное время", image: UIImage(named: "Экранное время") ?? UIImage.remove, cellType: .disclosureIndicator)],
        
        // Третье отделение
        [Setting(name: "Основные", image: UIImage(named: "Основные") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Пункт управления", image: UIImage(named: "Пункт управления") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Экран и яркость", image: UIImage(named: "Экран и яркость") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Экран Домой", image: UIImage(named: "Экран Домой") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Универсальный доступ", image: UIImage(named: "Универсальный доступ") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Обои", image: UIImage(named: "Обои") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Siri и Поиск", image: UIImage(named: "Siri и Поиск") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Face ID и код-пароль", image: UIImage(named: "Face ID и код-пароль") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Экстренный вызов – SOS", image: UIImage(named: "Экстренный вызов – SOS") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Уведомления о контакте", image: UIImage(named: "Уведомления о контакте") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Аккумулятор", image: UIImage(named: "Аккумулятор") ?? UIImage.remove, cellType: .disclosureIndicator),
         Setting(name: "Конфиденциальность и безопасность", image: UIImage(named: "Конфиденциальность и безопасность") ?? UIImage.remove, cellType: .disclosureIndicator)]

        ]
}
