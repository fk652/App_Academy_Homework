function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}
mysteryScoping1();
console.log();

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}
mysteryScoping2();
console.log();

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';  
//     console.log(x);
//   }
//   console.log(x);
// }
// mysteryScoping3();
// console.log();

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}
mysteryScoping4();
console.log();

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';  
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
// mysteryScoping5();
// console.log();

function madLib(verb, adjective, noun) {
  // return "We shall " + verb.toUpperCase() + " the " + adjective.toUpperCase() + ' ' + noun.toUpperCase();
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`;
}
console.log(madLib('make', 'best', 'guac'));
console.log();

function isSubstring(searchString, subString) {
  // return searchString.split(' ').includes(subString);
  return searchString.split(' ').indexOf(subString) != -1;
}
console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));
console.log();

function fizzBuzz(array) {
  let result = [];
  array.forEach(ele => {
    if ((ele % 3 === 0 && ele % 5 !== 0) || 
      (ele % 5 === 0 && ele % 3 !== 0)) {
      result.push(ele);
    }
  });
  return result;
}
console.log(fizzBuzz([3, 5, 7, 9, 15]));
console.log();

function isPrime(number) {
  for(let i=2; i < number; i++) {
    if (number % i == 0) { return false; }
  }
  return true;
}
console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));
console.log();

function sumOfNPrimes(n) {
  let count = 0
  let sum = 0
  let i = 2
  while (count < n) {
    if (isPrime(i)) {
      count++;
      sum += i;
    }
    i++;
  }
  return sum;
}
console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));