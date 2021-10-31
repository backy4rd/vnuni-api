const knex = require('knex');

module.exports = knex({
  client: 'mssql',
  connection: {
      user: 'sa',
      password: 'Password1',
      database: 'vnuni',
      host: 'localhost',
      port: 1433,
      options: {
        trustServerCertificate: true, // change to true for local dev / self-signed certs
      },
  }
})