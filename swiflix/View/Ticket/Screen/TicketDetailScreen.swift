//
//  TicketDetailScreen.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 08/02/25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

func generateQRCode(from string: String) -> UIImage {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    filter.message = Data(string.utf8)
    
    if let outputImage = filter.outputImage {
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
    }
    
    return UIImage(systemName: "xmark.circle") ?? UIImage()
}

struct TicketDetailScreen: View {
    let ticket: TicketEntity
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack(alignment: .leading) {
                SwiflixRemoteImage(urlString: ticket.moviePosterPath ?? "") { image in
                    image
                        .resizable()
                        .scaledToFill()
                    
                } placeholder: {
                    Color.gray
                }
                .frame(width: geo.size.width - 40)
                .frame(height: 180)
                .clipped()
                
                Spacer()
                    .frame(height: 16)
                
                Group {
                    Text(ticket.movieName)
                        .font(.title3)
                    
                    Spacer()
                        .frame(height: 16)
                    
                    HStack(alignment: .top) {
                        Text("cinema")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(ticket.theaterName)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("date_and_time")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(dateAndTime(date: ticket.bookingDate, time: ticket.bookingTime))
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("seat_number")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(ticket.seats.joined(separator: ", "))
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Spacer().frame(height: 8)
                    
                    HStack(alignment: .top) {
                        Text("order_id")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(ticket.orderId)
                            .font(.callout)
                            .multilineTextAlignment(.trailing)
                        
                    }
                }
                .padding(.horizontal, 16)
                
                
                Spacer()
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("name")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(ticket.username)
                            .font(.callout)
                        
                        Spacer()
                            .frame(height: 8)
                        
                        Text("paid")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text(ticket.totalPrice.toRupiah())
                            .font(.callout)
                    }
                    
                    Spacer()
                    
                    
                    Image(uiImage: generateQRCode(from: ticket.orderId))
                        .resizable()
                        .interpolation(.none) // Agar tetap tajam
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    
                    
                    
                }
                .padding(.horizontal, 16)
                
                
                Spacer()
                    .frame(height: 16)
            }
            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height - 175)
            .background(Color(.systemBackground))
            .clipShape(TicketShape())
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 5, x: 5, y: 5)
            .padding(.horizontal, 20)
            .overlay {
                DashedLine()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [10]))
                    .frame(width: geo.size.width - 100, height: 1)
                    .offset(y: ((geo.size.height - 175) / 2) - 175)
                
            }
            
        }
        .background(Color(.systemGray6))
    }
}


private func dateAndTime(date: Date, time: TimeEntity) -> String  {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E d"
    
    let formattedDate = dateFormatter.string(from: date)
    
    return "\(formattedDate), \(time.asString)"
}


struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // Gambar garis horizontal dari kiri ke kanan
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        }
    }
}

struct TicketShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.maxY - 200))
            path.addArc(center: CGPoint(x: rect.maxX, y: rect.maxY - 175),
                        radius: 26,
                        startAngle: Angle(degrees: -90),
                        endAngle: Angle(degrees: 90),
                        clockwise: true)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 150))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 150))
            path.addArc(center: CGPoint(x: rect.minX, y: rect.maxY - 175),
                        radius: 26,
                        startAngle: Angle(degrees: 90),
                        endAngle: Angle(degrees: -90),
                        clockwise: true)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 200))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 200))
            
        }
        
    }
}

#Preview {
    TicketDetailScreen(ticket: mockTicket)
}
