
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = ((wwhile (let helper x = (f x) != (f b) in helper)), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(7,30)-(7,71)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(7,46)-(7,60)
(f x , f x = f b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(7,55)-(7,60)
f x = f b
BopG (AppG [EmptyG]) (AppG [EmptyG])

(7,58)-(7,59)
x
VarG

(7,58)-(7,59)
f
VarG

(7,58)-(7,59)
f b
AppG [VarG]

*)
