//
//  ColorType.swift
//  ColorOfMood
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//



import UIKit

enum ColorType: String {
    case green = "Зеленый"
    case yellow = "Желтый"
    case blue = "Синий"
    case purple = "Сиреневый"
    
    var definition: String {
        switch self {
        case .green:
            return "Зеленый цвет оказывает самое существенное влияние на вас в данную минуту. Желание постичь себя и понять эмоции окружающих, потребность искать ответы на вопрос \"Как изменить свою жизнь\" - результат воздействия этого цвета. Для вас наступил период самоанализа, это не значит, что стоит обращаться за советами к психологу, зеленый цвет хорош именно тем, что дает не только потребность анализировать, но и способности и силы сделать это самостоятельно, хотя решение подобных задач и может занять время."
        case .yellow:
            return "Желтый цвет оказывается самое существенное влияние на вас в данную минуту. Жажда общения и тяга к свежим новостям - результат его воздействия. Вам хочется рассказать о себе миру, обязательно быть услышанными, неважно - выражается это в общении в соцсетях или в общении с друзьями в реальной жизни. Потребность купить модный журнал, даже если вам это и не свойственно, вызвана тем, что вы находитесь под воздействием желтого цвета."
        case .blue:
            return "Синий цвет оказывает самое существенное влияние на вас в данную минуту. Потребность в уединении и тишине преобладает у вас в настоящий момент, желание обдумать происходящие события и погрузиться в анализ ситуации являются основными тенденциями. Нет ничего противоестественного в том, что иногда нужно ограничить общение с окружающими и уделить время только себе, такая здоровая доля эгоизма пойдет только на пользу."
        case .purple:
            return "Сиреневый цвет оказывает самое существенное влияние на вас в данную минуту. Вы испытываете острую потребность видеть в окружающих вас людях только хорошее, а в пространстве вокруг - только положительные изменения. Неодолимая тяга к уюту очень характерна для вас в настоящий момент, и не стоит этому противиться, возможно, вы переутомились или просто устали от череды важных событий в вашей жизни. Воздействие сиреневого цвета поможет расслабиться и отдохнуть душой, занявшись любимым делом. Оглядываясь вокруг вы не замечаете негативных событий, видя во всем что-то хорошее. Ваша жизненная позиция на настоящий момент близка к фразе \"Стакан наполовину полон скорее, нежели наполовину пуст\"."
        }
    }
    
    var colorUI: UIColor {
        switch self {
        case .green:
            return .green
        case .yellow:
            return .yellow
        case .blue:
            return .blue
        case .purple:
            return .purple
        }
    }
    
    var image: UIImage {
        switch self {
        case .green:
            return #imageLiteral(resourceName: "green")
        case .yellow:
            return #imageLiteral(resourceName: "yellow")
        case .blue:
            return #imageLiteral(resourceName: "blue")
        case .purple:
            return #imageLiteral(resourceName: "purple")
        }
    }
}
