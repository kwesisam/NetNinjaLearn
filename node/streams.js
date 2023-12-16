const fs = require('fs');

const readStream = fs.createReadStream('./doc/blog2.txt')

readStream.on('data', (chunk) => {

    console.log(chunk)
})