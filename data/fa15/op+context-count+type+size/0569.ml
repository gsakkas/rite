
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo f b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let foo b =
    let result = f b in
    if result = b then (result, false) else (result, true) in
  wwhile (foo, b);;

*)

(* changed spans
(5,11)-(7,58)
*)

(* type error slice
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,65)
(2,64)-(2,69)
(5,3)-(8,17)
(5,11)-(7,58)
(5,13)-(7,58)
(8,3)-(8,9)
(8,3)-(8,17)
(8,11)-(8,14)
(8,11)-(8,17)
*)
