/* eslint-env jest */

const calculator = require('./calculator');

describe('Calculator', () => {
  
  test('adds 1 + 2 to equal 3', () => {
    expect(calculator.add(1, 2)).toBe(3);
  });

  test('subtracts 4 - 2 to equal 2', () => {
    expect(calculator.subtract(4, 2)).toBe(2);
  });
 
  test('multiply 5 * 2 to equal 10', () => {
    expect(calculator.multiplication(5, 2)).toBe(10);
  });
});
