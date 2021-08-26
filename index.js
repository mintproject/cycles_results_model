const express = require('express')
const bodyParser = require('body-parser')
const db = require('./queries')

const app = express()
const port = 3000

app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));

app.get('/', (request, response) => {
    response.json({ info: 'Node.js, Express, and Postgres API' })
})

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})

app.get('/getCyclesResults/:crop_name/:start_planting_day/:fertilizer_rate/:weed_fraction', db.getCyclesResults)