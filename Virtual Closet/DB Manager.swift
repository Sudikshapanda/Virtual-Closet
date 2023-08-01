//  DB Manager.swift
//  Virtual Closet
//
//  Created by Sudiksha Panda on 6/5/23.
//

import Foundation
import SQLite3

class Item
{
    var id: Int=0
    var type: String=""
    var color: String=""
    var season: String=""
    
    init(id:Int, type:String, color:String, season:String)
    {
        self.id = id
        self.type = type
        self.color = color
        self.season = season
    }
}

class DBManager
{
    init()
    {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    
    
    func openDatabase()->OpaquePointer?
    {
        let filePath = try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("error opening database")
            return nil
        }
        else
        {
            print("Successfully created connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Item(Id INTEGER PRIMARY KEY,type TEXT,color TEXT, season TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("Item table created.")
            } else {
                print("Item table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(id:Int, type:String, color:String, season:String)
    {
        let items = read()
        for i in items
        {
            if i.id == id
            {
                return
            }
        }
        let insertStatementString = "INSERT INTO item (Id, type, color, season) VALUES (?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32(id))
            sqlite3_bind_text(insertStatement, 2, (type as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (color as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (season as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("Successfully inserted row")
            } else {
                print("Could not insert row")
            }
            sqlite3_finalize(insertStatement)
        }
        
        func read()-> [Item]{
            let queryStatementString = "SELECT * FROM item;"
            var queryStatement: OpaquePointer? = nil
            var itm : [Item] = []
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                        while sqlite3_step(queryStatement) == SQLITE_ROW {
                            let id = sqlite3_column_int(queryStatement, 0)
                            let type = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                            let color = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                            let season = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                            itm.append(Item(id: Int(id), type: type,  color: color, season: season))
                            print("Query Result:")
                            print("\(id) | \(type) | \(color)| \(season)")
                        }
                    } else {
                        print("SELECT statement could not be prepared")
                    }
                    sqlite3_finalize(queryStatement)
                    return itm
                }
        func deleteByID(id:Int) {
            let deleteStatementStirng = "DELETE FROM item WHERE Id = ?;"
            var deleteStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
                sqlite3_bind_int(deleteStatement, 1, Int32(id))
                if sqlite3_step(deleteStatement) == SQLITE_DONE {
                    print("Successfully deleted row.")
                } else {
                    print("Could not delete row.")
                }
            } else {
                print("DELETE statement could not be prepared")
            }
            sqlite3_finalize(deleteStatement)
        }
    }
    
    func update(id: Int, newType: String, newColor: String, newSeason: String) {
        let updateStatementString = "UPDATE Item SET type = ?, color = ?, season = ? WHERE Id = ?;"
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(updateStatement, 1, (newType as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (newColor as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (newSeason as NSString).utf8String, -1, nil)
            sqlite3_bind_int(updateStatement, 4, Int32(id))
            
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
            sqlite3_finalize(updateStatement)
        } else {
            print("UPDATE statement could not be prepared.")
        }
    }

}
