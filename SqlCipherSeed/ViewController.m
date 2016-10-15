//
//  ViewController.m
//  SqlCipherSeed
//
//  Created by Cafex-Development on 05/10/16.
//  Copyright © 2016 Cafex-Development. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSString *databasePath = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) getDBPath];
    sqlite3 *db;
    sqlite3_stmt *stmt;
    bool sqlcipher_valid = NO;
    if (sqlite3_open([databasePath UTF8String], &db) == SQLITE_OK) {
        const char* key = [@"BIGSecret" UTF8String];
        sqlite3_key(db, key, (int)strlen(key));
        if (sqlite3_exec(db, (const char*) "SELECT count(*) FROM sqlite_master;", NULL, NULL, NULL) == SQLITE_OK) {
            if(sqlite3_prepare_v2(db, "PRAGMA cipher_version;", -1, &stmt, NULL) == SQLITE_OK) {
                if(sqlite3_step(stmt)== SQLITE_ROW) {
                    const unsigned char *ver = sqlite3_column_text(stmt, 0);
                    if(ver != NULL) {
                        sqlcipher_valid = YES;
                        
                        // password is correct (or database initialize), and verified to be using sqlcipher
                        
                    }
                }
                sqlite3_finalize(stmt);
            }
        }
        sqlite3_close(db);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
