
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), (b = (f x))) in helper b), b);;


(* fix

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rand = makeRand (10, 39);;

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let x = rand (1, 4);;

let fixpoint (f,b) =
  wwhile ((let helper b = ((f b), (b = (f x))) in helper), b);;

*)

(* changed spans
(2,16)-(5,14)
Array.of_list
VarG

(2,16)-(5,14)
seed1
VarG

(2,16)-(5,14)
seed2
VarG

(2,16)-(5,14)
Random.State.make
VarG

(2,16)-(5,14)
seed
VarG

(2,16)-(5,14)
x
VarG

(2,16)-(5,14)
Random.State.int
VarG

(2,16)-(5,14)
s
VarG

(2,16)-(5,14)
y
VarG

(2,16)-(5,14)
x
VarG

(2,16)-(5,14)
makeRand
VarG

(2,16)-(5,14)
fun (seed1 , seed2) ->
  (let seed =
     Array.of_list [seed1 ; seed2] in
   let s =
     Random.State.make seed in
   fun (x , y) ->
     x + Random.State.int s
                          (y - x))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,16)-(5,14)
fun (x , y) ->
  x + Random.State.int s (y - x)
LamG (BopG EmptyG EmptyG)

(2,16)-(5,14)
Array.of_list [seed1 ; seed2]
AppG (fromList [ListG EmptyG Nothing])

(2,16)-(5,14)
Random.State.make seed
AppG (fromList [VarG])

(2,16)-(5,14)
Random.State.int s (y - x)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,16)-(5,14)
makeRand (10 , 39)
AppG (fromList [TupleG (fromList [EmptyG])])

(2,16)-(5,14)
x + Random.State.int s (y - x)
BopG VarG (AppG (fromList [EmptyG]))

(2,16)-(5,14)
y - x
BopG VarG VarG

(2,16)-(5,14)
10
LitG

(2,16)-(5,14)
39
LitG

(2,16)-(5,14)
let seed =
  Array.of_list [seed1 ; seed2] in
let s =
  Random.State.make seed in
fun (x , y) ->
  x + Random.State.int s (y - x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,16)-(5,14)
let s =
  Random.State.make seed in
fun (x , y) ->
  x + Random.State.int s (y - x)
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LamG EmptyG)

(2,16)-(5,14)
(10 , 39)
TupleG (fromList [LitG])

(2,16)-(5,14)
[seed1 ; seed2]
ListG VarG Nothing

(7,14)-(8,63)
rand
VarG

(7,14)-(8,63)
rand (1 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(7,14)-(8,63)
1
LitG

(7,14)-(8,63)
4
LitG

(7,14)-(8,63)
(1 , 4)
TupleG (fromList [LitG])

(8,22)-(8,46)
fun b -> (f b , b = f x)
LamG (TupleG (fromList [EmptyG]))

(8,30)-(8,31)
b
VarG

*)
