
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r =
      if isFPoint r then (r, true) else go ((iterate (x, r)), false) in
    go x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(8,5)-(12,9)
(9,5)-(12,9)
(9,18)-(9,28)
(9,25)-(9,26)
(9,25)-(9,28)
(9,27)-(9,28)
(10,5)-(12,9)
(10,16)-(11,68)
(11,7)-(11,68)
(11,10)-(11,18)
(11,10)-(11,20)
(11,19)-(11,20)
(11,27)-(11,28)
(11,30)-(11,34)
(12,5)-(12,9)
(13,3)-(13,16)
*)

(* type error slice
(8,5)-(12,9)
(8,18)-(8,37)
(8,24)-(8,32)
(8,31)-(8,32)
(9,5)-(12,9)
(9,18)-(9,28)
(9,25)-(9,26)
(9,25)-(9,28)
(10,5)-(12,9)
(10,16)-(11,68)
(11,10)-(11,18)
(11,10)-(11,20)
(11,19)-(11,20)
(11,41)-(11,43)
(11,41)-(11,68)
(11,46)-(11,53)
(11,46)-(11,59)
(11,46)-(11,68)
(11,55)-(11,56)
(11,55)-(11,59)
(12,5)-(12,7)
(12,5)-(12,9)
(12,8)-(12,9)
*)
