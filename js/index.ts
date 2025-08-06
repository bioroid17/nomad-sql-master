import { createClient } from "redis";

const client = createClient();

await client.connect();

await client.flushAll();

// await client.set("hello", "world");

// const result = await client.get("hello");

await client.hSet("users:1", { username: "nico", password: "1234" });

const result = await client.hGetAll("users:1");
console.log(result);

await client.disconnect();
