app.use(bodyParser.urlencoded({extended: true}));
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'web ban hang nodejs',
});
initWebRoutes(app);
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});
const PORT = process.env.PORT || 8080;
// Set up view engine
configViewEngine(app);
// Set up routes
app.use('/', productRoutes);
// Start server
app.listen(PORT, () => {
    console.log("Web ban hang dang chay" +PORT);