LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)
let (x , y) = f b in
if y = true
then wwhile (f , x)
else x
let (b' , c') = f b in
if c'
then wwhile (f , b')
else b'
