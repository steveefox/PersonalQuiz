//
//  Human.swift
//  PersonalQuiz
//
//  Created by Nikita on 6/13/20.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

struct Human {
    let name: String
    let surname: String
    var fullname: String {
        name + " " + surname
    }
}
