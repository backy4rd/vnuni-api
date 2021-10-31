const knex = require('knex');

module.exports = knex({
  client: 'mssql',
  connection: {
      user: process.env.DB_USER || 'sa',
      password: process.env.DB_PASSWORD || 'password',
      database: process.env.DB_NAME || 'vnuni',
      host: 'localhost',
      port: 1433,
      options: {
        trustServerCertificate: true, // change to true for local dev / self-signed certs
      },
  }
})