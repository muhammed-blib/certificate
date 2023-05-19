const { sum } = require('../math');

describe('sum', () => {
  test('should return 0 when given an empty list', () => {
    expect(sum([])).toBe(0);
  });

  test('should return the sum of a list of numbers', () => {
    expect(sum([1, 2, 3])).toBe(6);
    expect(sum([4, 5, 6])).toBe(15);
    expect(sum([-1, 0, 1])).toBe(0);
  });
});