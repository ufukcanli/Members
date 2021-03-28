//
//  DetailsView.swift
//  Members
//
//  Created by Ufuk Canlı on 28.03.2021.
//

import SwiftUI

struct DetailsView: View {
    let member: Member
    
    var body: some View {
        List {
            Text("\(member.age) years old.")
            Text("Lives in \(member.location).")
            Text("GitHub: @\(member.github)")
            Text("\(member.hipo.position).")
            Text("Been working for \(member.hipo.yearsInHipo) years.")
        }
        .navigationTitle("\(member.name)")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(member: sampleMember)
    }
}
