const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

const app = express();
const port = 4000;


app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'public'));

// DB connection
const db = new sqlite3.Database('./focus.db', (err) => {
  if (err) {
    console.error(err.message);
    return;
  }
  console.log('Connected to the focus database.');
});

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.static('public'));

// Routes
app.get('/', (req, res) => {
  res.redirect('/login');
});

// Login
app.post('/login', (req, res) => {
  const { username, password } = req.body;

  db.get(
    'SELECT * FROM USERS WHERE username = ? AND password = ?',
    [username, password],
    (err, row) => {
      if (err) {
        console.error(err.message);
        return res.status(500).send('Internal Server Error');
      }
      if (!row) {
        return res.status(401).send('Invalid username or password');
      }

      const roleId = row.role_id;

      db.get('SELECT * FROM ROLES WHERE id = ?', [roleId], (err, roleRow) => {
        if (err) {
          console.error(err.message);
          return res.status(500).send('Internal Server Error');
        }

        const user = { ...row, role: roleRow.role_name };

        // Endpoint to get the user's role after successful login
        app.post('/get-user-role', (req, res) => {
          res.json({ role: user.role });
        });

        res.sendFile('home.html', { root: __dirname });
      });
    }
  );
});


app.post('/create', (req, res) => {
  const { username, password, email, firstName, lastName, classNumber } = req.body;

  // check if the username already exists in the database
  db.get('SELECT * FROM USERS WHERE username = ?', [username], (err, row) => {
    if (err) {
      console.error(err.message);
      res.status(500).send('Internal Server Error');
    } else if (row) {
      // username already exists, return an error
      res.status(409).send('Username already exists');
    } else {8
      // Username is available, add user to DB
      db.run(
        'INSERT INTO USERS (username, password, email, firstName, lastName, classNumber) VALUES (?, ?, ?, ?, ?, ?)',
        [username, password, email, firstName, lastName, classNumber],
        function (err) {
          if (err) {
            console.error(err.message);
            res.status(500).send('Internal Server Error');
          } else {
            // User successfully created, redirect to login page
            res.redirect('/login');
          }
        }
      );
    }
  });
});

// add function here later for the calendar and goal tracker 

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
