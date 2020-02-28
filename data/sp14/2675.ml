
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile
    (let f' b' = let bb = f b in (bb, (bb = (f b))) in ((wwhile (f', b)), b));;


(* fix

let fixpoint (f,b) =
  let rec helper (f,b) =
    let b' = f b in if b' = b then b' else helper (f, b') in
  helper (f, b);;

*)

(* changed spans
(5,3)-(6,78)
let rec helper =
  fun (f , b) ->
    (let b' = f b in
     if b' = b
     then b'
     else helper (f , b')) in
helper (f , b)
LetG Rec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,45)-(2,78)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,64)-(2,65)
(2,76)-(2,78)
(5,3)-(5,9)
(5,3)-(6,78)
(6,5)-(6,78)
(6,56)-(6,77)
(6,57)-(6,73)
(6,58)-(6,64)
*)
