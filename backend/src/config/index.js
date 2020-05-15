require('dotenv').config();

const config = {
  port: process.env.PORT || 3000,
  mysql: {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    dbPort: process.env.DBPORT,
  }
};

module.exports = config;