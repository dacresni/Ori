
function dbInit()
{
    var db = LocalStorage.openDatabaseSync("ConnectionsDB", "", "Store Connections", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS connections (name TEXT,hostname TEXT, port INT, created DATETIME )')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("ConnectionsDB", "", "Store Connections", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(name, hostname, port, created )
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO connections VALUES(?, ?, ?)',
                      [ name, hostname, port, created ])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,date,trip_desc,distance FROM connections order by rowid desc')
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
                                 checked: " ",
                                 date: results.rows.item(i).date,
                                 trip_desc: results.rows.item(i).trip_desc,
                                 distance: results.rows.item(i).distance
                             })
        }
    })
}

function dbUpdate(Pdate, Pdesc, Pdistance, Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'update connections set date=?, trip_desc=?, distance=? where rowid = ?', [Pdate, Pdesc, Pdistance, Prowid])
    })
}

function dbDeleteRow(Prowid)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from connections where rowid = ?', [Prowid])
    })
}
