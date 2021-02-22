//
//  CalendarView.swift
//  Haruharu
//
//  Created by Toxumuharu on 2021/02/09.
//

import SwiftUI

struct CalendarView: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Start Date",
                   selection: $date,
                   displayedComponents: [.date])
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
