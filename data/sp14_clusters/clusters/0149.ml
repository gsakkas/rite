LetG NonRec [AppG [EmptyG]] (IteG EmptyG EmptyG EmptyG)
let ans = f b in
if b = ans
then (ans , false)
else (ans , true)
let (a' , b') = f b in
if b' = true
then wwhile (f , b')
else a'
let (a' , b') = f b in
if b' = true
then wwhile (f , b')
else a'
let (b' , c') = f b in
if c'
then wwhile (f , b')
else b'
let b' = f b in
if b' = b
then b'
else helper (f , b')
let b' = f b in
if b' = b
then b'
else helper (f , b')
let b' = f b in
if b' = b
then b'
else helper (f , b')
let explosion = explode w in
if explosion = listReverse explosion
then true
else false
