
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  ((wwhile (let helper x = ((f x), ((f x) != (f b))) in helper)), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let helper x = ((f x), ((f x) = (f b))) in helper), b);;

*)

(* changed spans
(8,11)-(8,63)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
TupleG [LetG NonRec [EmptyG] EmptyG,VarG]

(8,35)-(8,51)
f x = f b
BopG (AppG [EmptyG]) (AppG [EmptyG])

*)
