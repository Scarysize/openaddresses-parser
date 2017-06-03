#!/usr/local/bin/node
const readline = require('readline');
const fs = require('fs');

const [inputFile, outputFile] = process.argv.slice(2, 4);

if (!inputFile || !outputFile) process.exit(1);

const parseLine = line => line.split(',').slice(0, 2).join(',') + '\n';
const lineReader = readline.createInterface({
  input: fs.createReadStream(inputFile)
});
const output = fs.createWriteStream(outputFile);

lineReader.on('line', line => {
  output.write(parseLine(line));
});

lineReader.on('close', () => output.close());
