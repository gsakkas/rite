#!/usr/bin/python2

import cgi
from Cookie import SimpleCookie
import glob
import hashlib
import json
import MySQLdb
import os
import random
import re
import sys
import time
import uuid

form = cgi.FieldStorage()

snippetsdir = "pairs.gordon.3"

db = None;
c  = None;
if "HTTP_COOKIE" in os.environ:
    cookies = SimpleCookie( os.environ[ 'HTTP_COOKIE' ] )
else:
    cookies = SimpleCookie()
sid_cookie = "rdblty-session-id"

def connect():
    global c
    global db
    if c != None:
        return c
    db = MySQLdb.connect(
        host="localhost",
        user="jondorn",
        passwd="jondorn",
        db="jondorn_readability_live",
    )
    c = db.cursor()
    return c

def new_session():
    global c

    code = 0
    while code == 0:
        sid = hashlib.md5(
            str( time.time() )
            + os.environ.get( "HTTP_USER_AGENT", "" )
            + os.environ.get( "REMOTE_ADDR", "" )
            + os.environ.get( "REMOTE_PORT", "" )
            + os.environ.get( "HTTP_ACCEPT", "" )
        ).hexdigest()

        connect()
        addr = os.environ[ "REMOTE_ADDR" ]
        code = c.execute(
            "INSERT INTO users ( session, address ) VALUES ( %s, %s );",
            ( sid, addr )
        )

    cookies[ sid_cookie ] = sid
    return sid

def get_session_id():
    global c
    if "session" in form:
        session = form[ "session" ].value
    else:
        session = cookies[ sid_cookie ].value

    connect()
    code = c.execute( "SELECT id FROM users WHERE session=%s;", session )
    if code != 1:
        raise Exception( "bad session '%s': %d" % ( session, code ) )
    sid = int( c.fetchone()[ 0 ] )
    random.seed( sid )
    return sid

def get_rotation( user_id, snip_id ):
    user_id = int( user_id )
    snip_id = int( snip_id )
    return ( user_id ^ snip_id ) & 0x1

def get_snippet_id( num, record = False ):
    global c

    sid = get_session_id()

    snippets = glob.glob( os.path.join( snippetsdir, "*" ) )
    total = len( snippets )

    # We need to rotate the order of choices so that some participants get A on
    # the left and some get A on the right. This corresponds to rotating by 0 or
    # 1. We implement this with a shuffled list of rotation sizes. It does not
    # matter that this list is longer than the list of snippets; as long as the
    # probability of a 0-rotation or 1-rotation is correct.

    rotations = [ 0, 1 ] * total

    # Sort the snippets before shuffling them so that the order is
    # deterministic with the same random seed.

    snippets.sort()
    random.shuffle( snippets )
    random.shuffle( rotations )
    index = ( sid * 11 + int( num ) ) % total

    if record:
        snip = snippets[ index ]
    
        snip_id = os.path.basename( snip )

        code = c.execute(
            "INSERT INTO snippets ( userid, rownum, snippet )"
            + " VALUES ( %s, %s, %s );",
            ( sid, num, snip_id )
        )
        if code != 1:
            raise Exception( "could not reserve snippet" )
        return snip_id, rotations[ index ]
    else:
        code = c.execute(
            "SELECT snippet FROM snippets WHERE userid=%s AND rownum=%s;",
            ( sid, num )
        )
        if code == 0:
            raise Exception( "no snippet was reserved for user" )
        elif code == 1:
            return str( c.fetchone()[ 0 ] ), rotations[ index ]
        else:
            raise Exception( "too many snippets reserved!" )

def record_score():
    global c
    sid          = get_session_id()
    snippet, rot = get_snippet_id( form[ "snippetnum" ].value )
    time         = form[ "time" ].value
    score        = ord( str( form[ "score" ].value )[ 0 ] ) - ord( "A" )

    connect()
    code = c.execute(
        "INSERT INTO preferences ( userid, snippet, time, visible, canonical )"
        + " VALUES ( %s, %s, %s, %s, %s );",
        ( sid, snippet, time, score, ( score + rot ) % 2 ) )
    if code != 1:
        raise Exception( "could not record score" )
    db.commit()

    return { "status":   "success" }

def record_answers():
    global c
    sid = get_session_id()

    connect()
    completion_code = str( uuid.uuid4() ).replace( "-", "" )
    code = c.execute(
        "UPDATE users SET compcode = %s WHERE id = %s;",
        ( completion_code, sid )
    )
    return { "body": """
        <h2>Thank You!</h2>
        <p>Thank you for taking our survey.</p>
        <p>Completion code: <tt>%s</tt></p>
        """.strip() % completion_code
    };

def get_snippet():
    result = dict()
    if "session" in form:
        result[ "session" ] = form[ "session" ].value
    else:
        result[ "session" ] = new_session()
    sid = get_session_id()

    num, rot = get_snippet_id( form[ "snippetnum" ].value, True )
    aname = os.path.join( snippetsdir, num, "a.html" )
    bname = os.path.join( snippetsdir, num, "b.html" )
    if rot != 0:
        aname, bname = bname, aname

    if os.path.exists( aname ) and os.path.exists( bname ):
        result[ "lang" ] = "text/x-java"
        with open( aname ) as a:
            result[ "left" ] = a.read()
        with open( bname ) as b:
            result[ "right" ] = b.read()

        return result
    else:
        raise Exception( "Do not know snippet " + form[ "snippetnum" ].value + "(" + aname + ", " + bname + ")" )

try:
    debuglog = "/tmp/readability.log"
    if os.path.exists( debuglog ):
        os.remove( debuglog )
#    with open( debuglog, 'w' ) as fh:
#        print >>fh, form

    if "score" in form:
        result = record_score()
    elif "exp1" in form:
        result = record_answers()
    else:
        result = get_snippet()
except Exception as e:
    result = { "error": repr( e ) }
except:
    result = { "error": "unknown exception (not subclass of Exception)" }
finally:
    if c != None:
        c.close()
    if db != None:
        db.close()

print "Content-Type: text/html"
print cookies
print
print json.dumps( result )

