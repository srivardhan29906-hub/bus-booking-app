# BusGo - Modern Flutter Bus Booking Application

BusGo is a production-ready, feature-packed Flutter bus reservation and ticketing application with an intuitive UI and smooth user experience.

## ✨ Features

- **Route Search**: Fast origin and destination search with popular travel routes and swapping capability.
- **Date Selector**: Quick calendar selector with shortcuts for today and tomorrow.
- **Dynamic Bus Listings**: Comprehensive filter & sorting by price, departure times, ratings, and bus types (AC/Non-AC, Sleeper/Seater).
- **Interactive Seat Selection**: Visual seat matrix with lower and upper deck sleeper/seater toggles, real-time total price calculation, and gender-specific seating.
- **Passenger Details & Form Validation**: Multi-passenger form validation with contact details.
- **Coupons & Promo Engine**: Instant discount coupons and promo codes calculation.
- **Mock Payment Gateway**: Support for UPI, Credit/Debit cards, and Net Banking checkout.
- **E-Tickets & Booking History**: PNR generation, digital ticket view, and ticket cancellation management.
- **Unit & Widget Testing**: Comprehensive suite of tests for bus services and formatters.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.3.0 <4.0.0)
- Dart SDK (>=3.3.0 <4.0.0)

### Installation

```bash
git clone https://github.com/srivardhan29906-hub/bus-booking-app.git
cd bus-booking-app
flutter pub get
flutter run
```

### Running Tests

```bash
flutter test
```

## 🛠️ Architecture

```
lib/
├── core/
│   ├── constants/
│   └── theme/
├── data/
├── models/
├── screens/
├── services/
├── utils/
└── widgets/
```

## 📄 License
This project is licensed under the MIT License.
