#!/usr/bin/env python

import cgi
from Cookie import SimpleCookie
import glob
import hashlib
import json
import sqlite3
import os
import random
import re
import sys
import time
import uuid
import cgitb; cgitb.enable()

form = cgi.FieldStorage(keep_blank_values=True)

snippetsdir = "data"

db = None;
c  = None;
if "HTTP_COOKIE" in os.environ:
    cookies = SimpleCookie( os.environ[ 'HTTP_COOKIE' ] )
else:
    cookies = SimpleCookie()
sid_cookie = "nanomaly-session-id"

# snippets = [ 'prog0971', 'palindrome', 'prog0223', 'prog3382', # 'prog0553',
#              'prog2746', 'gist1', 'gist2', 'gist3', 'prog3197' ]

snippets = [
    # intro
    # 'fac', # maybe use this for tutorial instead??
    'sumList',
    'append',
    'prog0310',

    # medium
    'prog0276',
    'palindrome',
    'prog0146',

    # hard
    'prog0358',
    'prog0223',
    'prog0971',
]

def connect():
    global c
    global db
    if c != None:
        return c
    db = sqlite3.connect(
        'nanomaly.db'
    )
    c = db.cursor()
    return c

if not os.path.exists('nanomaly.db'):
    connect()
    c.execute('''CREATE TABLE users
                 (id integer primary key asc, u_group text,
                  session text, compcode text, email text,
                  important text, compilers text, other text);''')
    c.execute('''CREATE TABLE responses
                 (userid text, snippet text, r_group text, time integer,
                  cause text, explanation text, fix text,
                  PRIMARY KEY (userid, snippet) );''')
    c.execute('''INSERT INTO users (session, u_group) VALUES (?, ?);''', ("foo", "ocaml"))
    db.commit()

def new_session():
    global c
    connect()

    c.execute('SELECT u_group FROM users ORDER BY ID DESC LIMIT 1;')
    r = c.fetchone()
    if r is None:
        g = 'ocaml'
    elif r[0] == 'ocaml':
        g = 'nanomaly'
    else:
        g = 'ocaml'

    sid = uuid.uuid4()
    c.execute(
        "INSERT INTO users ( session, u_group ) VALUES ( ?, ? );",
        ( str(sid), g )
    )
    db.commit()

    cookies[ sid_cookie ] = sid
    return str(sid)

def get_session_id():
    global c
    if sid_cookie in cookies:
        session = cookies[ sid_cookie ].value
    else:
        session = new_session()

    connect()
    c.execute( "SELECT id FROM users WHERE session=?;", (session, ) )
    x = c.fetchone()
    if x is None:
        new_session()
        return get_session_id()
    # if code != 1:
    #     raise Exception( "bad session '%s': %d" % ( session, code ) )
    sid = int( x[0] )
    return sid


def record_response():
    global c
    sid          = get_session_id()
    snippetnum   = int(form["snippetnum"].value)
    snippet      = snippets[snippetnum]
    # snippet, rot = get_snippet_id( form[ "snippetnum" ].value )
    time         = form[ "time" ].value
    # score        = ord( str( form[ "score" ].value )[ 0 ] ) - ord( "A" )

    connect()
    c.execute(
        "INSERT OR REPLACE INTO responses ( userid, snippet, r_group, time, cause, explanation, fix )"
        + " VALUES ( ?, ?, ?, ?, ?, ?, ? );",
        ( sid, snippet, form["group"]. value, time, form["cause"].value, form["explanation"].value, form["fix"].value ) )
    db.commit()

    if (snippetnum + 1 >= len(snippets)):
        completion_code = str( uuid.uuid4() ).replace( "-", "" )
        c.execute('UPDATE users SET compcode = ? WHERE id = ?;',
                  ( completion_code, sid)
        )
        db.commit()
        return {'compcode': '<tt>' + completion_code + '</tt>'}

    return get_snippet(snippetnum + 1)
    # return { "status":   "success" }

def record_email():
    global c
    sid = get_session_id()

    connect()
    # completion_code = str( uuid.uuid4() ).replace( "-", "" )
    # code = c.execute(
    #     "UPDATE users SET compcode = ? WHERE id = ?;",
    #     ( completion_code, sid )
    # )

    c.execute("UPDATE users SET email = ?, important = ?, compilers = ?, other = ? WHERE id = ?;",
              ( form["email"].value, form["important"].value, form["compilers"].value, form['other'].value, sid)
    )
    db.commit()

    return { "body": """
        <h2>Thank You!</h2>
        <p>Thank you for taking our survey.</p>
        <p>Completion code: <tt>%s</tt></p>
        """.strip() # % completion_code
    };

def choose_group(sid, snippetnum):
    c.execute('SELECT u_group FROM users WHERE id=?', (sid, ))
    g = c.fetchone()[0]
    if snippetnum % 2 == 0 and g == 'ocaml':
        return 'ocaml'
    elif snippetnum % 2 == 0 and g == 'nanomaly':
        return 'nanomaly'
    elif g == 'ocaml':
        return 'nanomaly'
    else:
        return 'ocaml'
    

def get_snippet(snippetnum):
    result = dict()

    sid = get_session_id()

    # num, rot = get_snippet_id( form[ "snippetnum" ].value, True )

    snippet = snippets[snippetnum]

    group = choose_group(sid, snippetnum)    

    mlname = os.path.join( snippetsdir, snippet) + '.ml'
    jsonname = os.path.join( snippetsdir, snippet) + '.ml.json'
    errname = os.path.join( snippetsdir, snippet) + '.ml.err'

    if os.path.exists( mlname ) and os.path.exists( jsonname ) and os.path.exists( errname ):
        with open( mlname ) as ml:
            result[ "prog" ] = ml.read()
        with open( jsonname ) as js:
            result[ "json" ] = js.read()
        with open( errname ) as err:
            result[ "err" ] = err.read()
        result[ "group" ] = group
        result[ "snippetnum" ] = snippetnum

        return result
    else:
        raise Exception( "Do not know snippet " + form[ "snippetnum" ].value + "(" + mlname + ", " + jsonname + ", " + errname + ")" )


debuglog = "nanomaly.log"
try:
    if os.path.exists( debuglog ):
        os.remove( debuglog )
    with open( debuglog, 'w' ) as fh:
        print >>fh, form

    if form.has_key("cause"):
        result = record_response()
    elif form.has_key("email"):
        result = record_email()
    else:
        result = get_snippet(0)
except Exception as e:
    with open( debuglog, 'w' ) as fh:
        import traceback
        print >>fh, form
        traceback.print_exc(file=fh)
    result = { "error": repr( e ) }
except:
    with open( debuglog, 'w' ) as fh:
        import traceback
        print >>fh, form
        traceback.print_exc(file=fh)
    result = { "error": "unknown exception (not subclass of Exception)" }
finally:
    if c != None:
        c.close()
    if db != None:
        db.close()

with open( debuglog, 'w' ) as fh:
    print >>fh, form
    print >>fh, "Content-Type: application/json"
    print >>fh, cookies
    print >>fh, ""
    print >>fh, json.dumps( result )

print "Content-Type: application/json"
print cookies
print
print json.dumps( result )

