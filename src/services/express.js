import express from 'express'

export class Express {

  /* Start Express server */
  static async startServer (config) {
    this.app = express()
    this.app.use(express.json())
    this.app.listen(config.express.port)
    console.log(`- Express server up and running on port :${config.express.port}`)
  }
}
