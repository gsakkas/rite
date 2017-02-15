
let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    (let x = f b in match x with | b -> (x, false) | _ -> ((x, true), b));;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let helper x = let y = f x in if y = x then (y, false) else (y, true) in
      helper), b);;

*)

(* changed spans
(4,28)-(4,36)
(4,33)-(4,35)
(8,4)-(8,73)
(8,13)-(8,16)
(8,15)-(8,16)
(8,20)-(8,72)
(8,40)-(8,50)
(8,41)-(8,42)
(8,44)-(8,49)
(8,59)-(8,68)
(8,60)-(8,61)
(8,70)-(8,71)
*)

(* type error slice
(8,20)-(8,72)
(8,20)-(8,72)
(8,40)-(8,50)
(8,41)-(8,42)
(8,58)-(8,72)
(8,59)-(8,68)
(8,60)-(8,61)
*)
