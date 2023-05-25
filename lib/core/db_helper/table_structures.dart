///
/// Table Names
///

/// transaction
const transaction1 = "transaction1";

/// master
const master1 = "master1";

///
/// Table structure
///
const transaction1Structure = '''CREATE TABLE $transaction1 (
    localId INTEGER PRIMARY KEY AUTOINCREMENT
    ,serverId INTEGER
    ,userName TEXT
    ,userAge INTEGER
    ,desc TEXT'''
//default column
    ''',isEdited INTEGER
    ,isDeleted INTEGER
    ,createdById INTEGER 
    ,createdDate TEXT 
    ,modifiedById INTEGER 
    ,modifiedDate TEXT 
   )''';

const master1Structure = '''CREATE TABLE $master1 (
    serverId INTEGER PRIMARY KEY
    ,title TEXT
    ,value INTEGER
    ,desc TEXT'''
//default column
    ''',isEdited INTEGER
    ,isDeleted INTEGER
    ,createdById INTEGER 
    ,createdDate TEXT 
    ,modifiedById INTEGER 
    ,modifiedDate TEXT 
   )''';
