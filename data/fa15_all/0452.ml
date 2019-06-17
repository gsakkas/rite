
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint x = ((f x) - x) < 0 in
  let rec test x = if isFPoint x then (x, true) else test ((f x), false) in
  wwhile (isFPoint, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint x = ((f x) - x) < 0 in (x, (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(7,3)-(9,23)
let gs =
  fun x ->
    (let isFPoint =
       fun x -> (f x - x) < 0 in
     (x , isFPoint x)) in
wwhile (gs , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(9,23)
(7,16)-(7,35)
(7,20)-(7,31)
(7,20)-(7,35)
(7,29)-(7,30)
(8,3)-(9,23)
(8,16)-(8,73)
(8,23)-(8,31)
(8,23)-(8,33)
(8,32)-(8,33)
(8,54)-(8,58)
(8,54)-(8,73)
(8,59)-(8,73)
(9,3)-(9,9)
(9,3)-(9,23)
(9,10)-(9,23)
(9,11)-(9,19)
*)
