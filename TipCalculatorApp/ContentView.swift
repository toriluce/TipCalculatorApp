import SwiftUI

struct ContentView: View {
    @State var billAmount: Double = 0.0
    @State var tipPercentage: Double = 15.0
    @State var numberOfPeople: Double = 1
    @State var showResults: Bool = false
    @State var isDollar: Bool = true
    
    var tipAmount: Double { billAmount * (tipPercentage / 100)}
    var totalAmount: Double { billAmount + tipAmount}
    var amountPerPerson: Double { totalAmount / numberOfPeople}
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(10)
            
            Button(action: {
                isDollar.toggle()})
            {
                Image(systemName: isDollar ? "dollarsign.circle.fill" : "eurosign.circle.fill")
                    .font(.system(size: 75))
                    .foregroundColor(.black)
                .shadow(radius: 5)}
            .padding(.bottom, 10)
            
            Text("Bill Amount")
            Text("\(billAmount, format: .currency(code: isDollar ? "USD" : "EUR"))")
                .foregroundColor(.green)
            Slider(value: $billAmount, in: 0...500, step: 1)
                .padding()
                .tint(.green)
            
            Text("Tip Percentage")
            Text("\(Int(tipPercentage))%")
                .foregroundColor(.purple)
            Slider(value: $tipPercentage, in: 0...30, step: 1)
                .tint(.purple)
                .padding()
            
            Text("Number of People")
            Text("\(Int(numberOfPeople))") .foregroundColor(.orange)
            Slider(value: $numberOfPeople, in: 1...20, step: 1)
                .tint(.orange)
                .padding()
            
            Button(action: {
                showResults.toggle()
            }) {
                Text(showResults ? "Hide Results" : "Calculate")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(showResults ? Color.red : Color.black)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            if showResults {
                VStack{
                    Text("Tip Amount: \(tipAmount, format: .currency(code: isDollar ? "USD" : "EUR"))")
                    Text("Total Amount: \(totalAmount, format: .currency(code: isDollar ? "USD" : "EUR"))")
                    Text("Amount per Person: \(amountPerPerson, format: .currency(code: isDollar ? "USD" : "EUR"))")
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
