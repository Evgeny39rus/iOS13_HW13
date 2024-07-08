import UIKit
import SnapKit

struct Setting: Hashable {
    var name: String
   // var image: UIImage   image: UIImage(named: "Image") ?? UIImage.remove,
    var cellType: TypeOfAccessories
    var statusText: String = ""
    var logoImageName: String?
    var backgroundColor: UIColor?
}

enum TypeOfAccessories {
    case disclosureIndicator
    case switchButton
}

extension Setting {
    static var newSetting: [[Setting]] = [
        // Первое отделение
        [Setting(name: "Авиарежим", cellType: .switchButton, logoImageName: "airplane", backgroundColor: .orange),
         Setting(name: "Wi-Fi", cellType: .disclosureIndicator, statusText: "Не подключен", logoImageName: "wifi",backgroundColor: .customBlue),
         Setting(name: "Bluetooth", cellType: .disclosureIndicator, statusText: "Вкл.", logoImageName: "airtag.radiowaves.forward.fill", backgroundColor: .customBlue),
         Setting(name: "Сотовая связь", cellType: .disclosureIndicator, logoImageName: "antenna.radiowaves.left.and.right", backgroundColor: .systemGreen),
         Setting(name: "Режим модема", cellType: .disclosureIndicator, logoImageName: "personalhotspot", backgroundColor: .systemGreen),
         Setting(name: "VPN", cellType: .disclosureIndicator, statusText: "Не подключен", logoImageName: "externaldrive.connected.to.line.below", backgroundColor: .customBlue)],

        // Второе отделение
        [Setting(name: "Уведомления", cellType: .disclosureIndicator, logoImageName: "bell.badge.waveform.fill", backgroundColor: .red),
         Setting(name: "Звуки, тактильные сигналы", cellType: .disclosureIndicator, logoImageName: "speaker.wave.2.fill", backgroundColor: .red),
         Setting(name: "Фокусирование", cellType: .disclosureIndicator, logoImageName: "moon.fill", backgroundColor: .systemPurple),
         Setting(name: "Экранное время", cellType: .disclosureIndicator, logoImageName: "hourglass", backgroundColor: .systemPurple)],
        
        // Третье отделение
        [Setting(name: "Основные", cellType: .disclosureIndicator, logoImageName: "gear", backgroundColor: .systemGray),
         Setting(name: "Пункт управления", cellType: .disclosureIndicator, logoImageName: "slider.horizontal.3", backgroundColor: .systemGray),
         Setting(name: "Экран и яркость", cellType: .disclosureIndicator, logoImageName: "microbe.fill", backgroundColor: .systemBlue),
         Setting(name: "Экран Домой", cellType: .disclosureIndicator, logoImageName: "ev.plug.ac.gb.t.fill", backgroundColor: .systemIndigo),
         Setting(name: "Универсальный доступ", cellType: .disclosureIndicator, logoImageName: "accessibility", backgroundColor: .systemBlue),
         Setting(name: "Обои", cellType: .disclosureIndicator, logoImageName: "photo.circle", backgroundColor: .systemCyan),
         Setting(name: "Siri и Поиск", cellType: .disclosureIndicator, logoImageName: "circlebadge.fill", backgroundColor: .black),
         Setting(name: "Face ID и код-пароль", cellType: .disclosureIndicator, logoImageName: "faceid", backgroundColor: .systemGreen),
         Setting(name: "Экстренный вызов – SOS", cellType: .disclosureIndicator, logoImageName: "sos", backgroundColor: .systemRed),
         Setting(name: "Уведомления о контакте", cellType: .disclosureIndicator, logoImageName: "sun.min", backgroundColor: .gray),
         Setting(name: "Аккумулятор", cellType: .disclosureIndicator, logoImageName: "magsafe.batterypack.fill", backgroundColor: .systemGreen),
         Setting(name: "Конфиденциальность и безопасность", cellType: .disclosureIndicator, logoImageName: "hand.raised.fill", backgroundColor: .systemBlue)]

        ]
}
