
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) = wwhile (let g x = f x in (((g b), ((g b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let g x = let xx = f x in (xx, (xx != b)) in g), b);;

*)

(* changed spans
(7,29)-(7,74)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
TupleG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG,VarG]

*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(4,19)-(4,20)
(4,19)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,62)-(4,63)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(7,22)-(7,28)
(7,22)-(7,74)
(7,29)-(7,74)
(7,47)-(7,73)
(7,48)-(7,69)
*)
