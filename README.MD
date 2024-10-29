# Trakteer Payment Gateway API

A Node.js-based payment gateway integration for Trakteer.id, supporting multiple payment methods including QRIS, e-wallets, virtual accounts, and credit cards.

## 🌟 Features

- Multiple payment method support:
  - QRIS
  - GoPay
  - OVO
  - DANA
  - LinkAja
  - ShopeePay
  - Virtual Accounts (BNI, BRI, Mandiri, Permata, BCA, Others)
  - Credit/Debit Cards

- Easy integration with Trakteer.id
- Secure payment processing
- Configurable through environment variables
- Docker support with HAProxy load balancer

## 📋 Prerequisites

- Node.js (Latest Version)
- npm
- Docker (optional, for containerization)

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/sazumivicky/trakteer-payment-api.git
cd trakteer-payment-api
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file in the root directory with the following variables:
```env
PORT=3000
TRAKTEER_API_URL=your_api_url
TRAKTEER_QRIS_URL=your_qris_url
TRAKTEER_GOPAY_URL=your_gopay_url
TRAKTEER_OVO_URL=your_ovo_url
TRAKTEER_DANA_URL=your_dana_url
TRAKTEER_LINKAJA_URL=your_linkaja_url
TRAKTEER_SHOPEEPAY_URL=your_shopeepay_url
TRAKTEER_VA_OTHERS_URL=your_va_others_url
TRAKTEER_VA_BNI_URL=your_va_bni_url
TRAKTEER_VA_BRI_URL=your_va_bri_url
TRAKTEER_VA_MANDIRI_URL=your_va_mandiri_url
TRAKTEER_VA_PERMATA_URL=your_va_permata_url
TRAKTEER_VA_BCA_URL=your_va_bca_url
TRAKTEER_CARDS_URL=your_cards_url
TRAKTEER_SESSION=your_session_token
CSRF_TOKEN=your_csrf_token
CREATOR_ID=your_creator_id
UNIT_ID=your_unit_id
SUPPORTER_ID=your_supporter_id
MIDTRANS_CHARGE_URL=your_midtrans_url
```

## 🏃‍♂️ Running the Application

### Standard Mode
```bash
npm start
```

### Using Docker
```bash
docker build -t trakteer-payment-api .
docker run -p 3000:3000 trakteer-payment-api
```

## 📝 API Usage

### Payment Endpoint

`GET /payment`

#### Query Parameters:
- `method` (required): Payment method (qris, gopay, ovo, dana, linkaja, shopeepay, va-others, va-bni, va-bri, va-mandiri, va-permata, va-bca, cards)
- `pizzas` (required): Quantity of pizzas (each pizza costs 50,000)
- `display_name` (optional): Supporter's display name
- `support_message` (optional): Support message
- `ovo_number` (required for OVO): Phone number for OVO payment
- `linkaja_number` (required for LinkAja): Phone number for LinkAja payment

#### Example Requests:

1. QRIS Payment:
```
http://localhost:3000/payment?method=qris&pizzas=2&display_name=John%20Doe&support_message=Keep%20it%20up!
```

2. OVO Payment:
```
http://localhost:3000/payment?method=ovo&pizzas=1&display_name=John%20Doe&support_message=Great%20work!&ovo_number=085236226786
```

3. Virtual Account BCA:
```
http://localhost:3000/payment?method=va-bca&pizzas=3&display_name=John%20Doe&support_message=Amazing!
```

4. GoPay:
```
http://localhost:3000/payment?method=gopay&pizzas=2&display_name=John%20Doe&support_message=Keep%20creating!
```

## 🔒 Security Features

- Environment variables for sensitive data
- CSRF token protection
- Request validation and sanitization
- Secure header configurations
- Rate limiting support
- Error handling and logging

## 🐳 Docker Configuration

The project includes Docker support with HAProxy as a load balancer:

### Docker Files
- `Dockerfile`: Contains the container configuration
- `haproxy.cfg`: HAProxy load balancer configuration

### Running with Docker Compose
```bash
docker-compose up -d
```

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| PORT | Server port | Yes |
| TRAKTEER_API_URL | Main API URL | Yes |
| TRAKTEER_SESSION | Session token | Yes |
| CSRF_TOKEN | CSRF protection token | Yes |
| CREATOR_ID | Your Trakteer creator ID | Yes |
| UNIT_ID | Trakteer unit ID | Yes |

## 📝 Error Handling

The API includes comprehensive error handling:
- Input validation errors (400)
- Authentication errors (401)
- Server errors (500)
- Payment gateway errors

## 🔄 Response Format

### Success Response
```json
{
  "success": true,
  "data": {
    "payment_url": "https://payment-url.example",
    "order_id": "ORDER123"
  }
}
```

### Error Response
```json
{
  "success": false,
  "error": "Error message description"
}
```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ✍️ Author

Sazumi Viki

## 🤝 Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 💖 Support

If you find this project helpful, please give it a ⭐️!

## 📞 Contact

- GitHub: [@sazumivicky](https://github.com/sazumivicky)
- Website: [sazumi.moe](https://sazumi.moe)
- Email: [root@sazumi.moe](mailto:root@sazumi.moe)

## 📝 Changelog

### [1.0.0] - 2024-03-XX
- Initial release
- Basic payment gateway integration
- Multiple payment method support
- Docker support with HAProxy