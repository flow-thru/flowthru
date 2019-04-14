
const expect = require('chai').expect
const server = require('../index');

describe('Header Test', () => {
    it('should return a string', () => {
        expect('<h1>Flow</h1>').to.equal('<h1>Flow</h1>');
    });
});
