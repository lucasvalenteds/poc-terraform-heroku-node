import * as HTTP from "http";
import Postgres from "pg";

async function main() {
  const postgres = new Postgres.Client(process.env.DATABASE_URL);
  await postgres.connect();

  const server = HTTP.createServer((_request, response) => {
    postgres.query("SELECT NOW()").then((result) => {
      response.statusCode = 200;
      response.write(JSON.stringify(result.rows[0]));
      response.end();
    });
  });
  server.listen(process.env.PORT);
}

main();
