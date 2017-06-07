#!/usr/local/bin/node
const readline = require('readline');
const fs = require('fs');

const [inputFile, outputFile] = process.argv.slice(2, 4);

if (!inputFile || !outputFile) process.exit(1);

const parseLine = line => {
  const match = /[A-Z0-9\.\-]+,[A-Z0-9\.\-]+/.exec(line);
  return match ? match[0] : null;
};
const lineReader = readline.createInterface({
  input: fs.createReadStream(inputFile)
});
const output = fs.createWriteStream(outputFile);

lineReader.on('line', line => {
  const parsedLine = parseLine(line);

  if (parsedLine) {
    output.write(parsedLine + '\n');
  }
});

lineReader.on('close', () => output.close());
