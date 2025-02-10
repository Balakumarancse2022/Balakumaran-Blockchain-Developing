const crypto = require('crypto');

class Block {
    constructor(index, data, previousHash = '') {
        this.index = index;
        this.timestamp = Date.now();
        this.data = data;
        this.previousHash = previousHash;
        this.hash = this.calculateHash();
    }

    calculateHash() {
        return crypto.createHash('sha256').update(this.index + this.timestamp + this.data + this.previousHash).digest('hex');
    }
}

class Blockchain {
    constructor() {
        this.chain = [new Block(0, 'Genesis Block', '0')];
    }

    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }

    addBlock(data) {
        let newBlock = new Block(this.chain.length, data, this.getLatestBlock().hash);
        this.chain.push(newBlock);
    }
}

let myBlockchain = new Blockchain();
myBlockchain.addBlock('Second Block');
myBlockchain.addBlock('Third Block');
console.log(JSON.stringify(myBlockchain, null, 4));
