#!/usr/local/bin/node
const readline = require('readline');
const fs = require('fs');

const [inputFile, outputFile] = process.argv.slice(2, 4);

if (!inputFile || !outputFile) process.exit(1);

const parseLine = line => /[A-Z0-9\.\-]+,[A-Z0-9\.\-]+/.exec(line)[0];
const lineReader = readline.createInterface({
  input: fs.createReadStream(inputFile)
});
const output = fs.createWriteStream(outputFile);

lineReader.on('line', line => {
  output.write(parseLine(line));
});

lineReader.on('close', () => output.close());
