const crypto = require('crypto');
const readline = require('readline');


function hashArrayElements(arr) {
  return arr.map(item => {
    return crypto.createHash('sha256').update(item.toString()).digest('hex');
  });
}
const rl = readline.createInterface({
input: process.stdin,
output: process.stdout
});
let inputArray = [];
function getInput() {
rl.question('Enter a value (type "done" to finish): ', (input) => {
    if (input.toLowerCase() === 'done') {
      const hashedArray = hashArrayElements(inputArray);
      console.log('Original Array:', inputArray);
      console.log('Hashed Array:', hashedArray);
      rl.close();
    } else {
       const value = isNaN(input) ? input : Number(input);
      inputArray.push(value);
      getInput();
    }
  });
}
getInput();
