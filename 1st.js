const crypto = require('crypto');

class Block {
    constructor(data, previousHash = '') {
        this.data = data;
        this.previousHash = previousHash;
        this.hash = crypto.createHash('sha256').update(data + previousHash).digest('hex');
    }
}

let genesisBlock = new Block('Genesis Block');
let secondBlock = new Block('Second Block', genesisBlock.hash);
console.log(genesisBlock, secondBlock);
