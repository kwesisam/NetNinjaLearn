const http = require('http');
const fs = require('fs')

const server = http.createServer(
    (req, res) => {
        console.log(req.url, req.method);

        //header content type
        res.setHeader('Content-type','text/html');

        let path = './views';
        /*res.setHeader('Content-Type', 'text/html');
        res.write("<p>hello again</p>");
        res.write("<a>hello again</a>");*/

        //send an html file
         fs.readFile('./views/index.html', (err, data) => {
            if(!err){
                res.write(data);
                res.end();
            }else{
                console.log(err);
                res.end();
            }
         })

    }
);

server.listen(3000,  'localhost', () => {
    console.log('listening for requests on port 3000');
})
