
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  ((wwhile (let helper x = (f x) != (f b) in helper b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,11)-(8,54)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(8,27)-(8,41)
(f x , f x = f b)
TupleG [AppG [EmptyG],BopG EmptyG EmptyG]

(8,36)-(8,41)
f x = f b
BopG (AppG [EmptyG]) (AppG [EmptyG])

(8,39)-(8,40)
x
VarG

(8,45)-(8,51)
f
VarG

(8,57)-(8,58)
helper
VarG

*)
