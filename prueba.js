const Web3 = require('web3');
async function main() {
  const web3 = new Web3('https://bsc-dataseed1.binance.org:443');
  const loader = setupLoader({ provider: web3 }).web3;

  const account = web3.eth.accounts.create();
  console.log(account);
}
