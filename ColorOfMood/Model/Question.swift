//
//  Question.swift
//  ColorOfMood
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Выберите подходящее вам утверждение",
                type: .single,
                answers: [
                    Answer(text: "Я ощущаю прилив сил и бодрости", type: .blue),
                    Answer(text: "Я испытываю приступ меланхолии", type: .blue),
                    Answer(text: "Моё состояние ровное и спокойное", type: .blue),
                    Answer(text: "Моё настроение можно описать как мечтательное", type: .blue),
                ]
            ),
            Question(
                text: "В настоящий момент вы бы предпочли",
                type: .single,
                answers: [
                    Answer(text: "Отправиться в путешествие, сорвавшись с места", type: .blue),
                    Answer(text: "Уютно устроиться с книгой", type: .blue),
                    Answer(text: "Посмотреть любимый фильм", type: .blue),
                    Answer(text: "Провести время с друзьями", type: .blue),
                ]
            ),
            Question(
                text: "В настоящий момент вы предпочитаете",
                type: .single,
                answers: [
                    Answer(text: "Одеваться неброско, практично", type: .blue),
                    Answer(text: "Носить мрачные, тёмные тона", type: .blue),
                    Answer(text: "Одеваться ярко, оригинально", type: .blue),
                    Answer(text: "Соблюдать деловой стиль в одежде", type: .blue),
                ]
            ),
            Question(
                text: "Выберите привлекающий вас в настоящий момент вид деятельности",
                type: .single,
                answers: [
                    Answer(text: "Спорт, активный отдых", type: .blue),
                    Answer(text: "Чтение", type: .blue),
                    Answer(text: "Интернет, общение, творчество", type: .blue),
                    Answer(text: "Просмотр фильмов, прогулки", type: .blue),
                ]
            )
        ]
    }
}
