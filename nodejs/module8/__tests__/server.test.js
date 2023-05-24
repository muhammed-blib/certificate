// server.test.js
const request = require("supertest");
const app = require("../server");

describe("POST /sum", () => {
  test("should return the sum of a list of numbers", async () => {
    const response = await request(app)
      .post("/sum")
      .send({ numbers: [1, 2, 3] })
      .expect(200);

    expect(response.body.result).toBe(6);
  });

  test("should handle an empty list of numbers", async () => {
    const response = await request(app)
      .post("/sum")
      .send({ numbers: [] })
      .expect(200);

    expect(response.body.result).toBe(0);
  });
});
