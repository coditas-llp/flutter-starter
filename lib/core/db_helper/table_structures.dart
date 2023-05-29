///
/// Table Names
///

/// transaction
//example feature
const transaction1 = "transaction1";

/// master
const master1 = "master1";

///
/// Table structure
///
/// transaction
const transaction1Structure = '''CREATE TABLE $transaction1 (
    localId INTEGER PRIMARY KEY AUTOINCREMENT
    ,serverId INTEGER
    ,userName TEXT
    ,userAge INTEGER
    ,desc TEXT
    $defaultColumns
   )''';


///master
const master1Structure = '''CREATE TABLE $master1 (
    serverId INTEGER PRIMARY KEY
    ,title TEXT
    ,value INTEGER
    ,desc TEXT
    $defaultColumns
   )''';

const defaultColumns = '''
    ,isEdited INTEGER
    ,isDeleted INTEGER
    ,createdById INTEGER 
    ,createdDate TEXT 
    ,modifiedById INTEGER 
    ,modifiedDate TEXT 
''';
