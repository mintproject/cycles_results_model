const copyTo = require('pg-copy-streams').to
const pg = require('pg')

const client = new pg.Client({
    user: 'dojo',
    host: 'localhost',
    database: 'cycles',
    password: 'mellowcubicle',
    port: 5432,
  }
)
client.connect();

const getCyclesResults = (request, response) => {
    const crop_name = request.params.crop_name
    const weed_fraction = parseFloat(request.params.weed_fraction)
    const start_planting_day = parseFloat(request.params.start_planting_day)
    const fertilizer_rate = parseFloat(request.params.fertilizer_rate)

    query = "SELECT date,country,admin1,admin2,admin3,production,grain_yield FROM cycles_results WHERE crop_name='"+crop_name+"' AND start_planting_day="+start_planting_day+" AND fertilizer_rate="+fertilizer_rate+" AND weed_fraction='"+weed_fraction+"'";
    copy_q = `COPY (${query}) to STDOUT with csv DELIMITER ','`
    const dataStream = client.query(copyTo(copy_q))
    response.setHeader("content-type", "text/csv");
    dataStream.pipe(response)
}

module.exports = {
    getCyclesResults
}