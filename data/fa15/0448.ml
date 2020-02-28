
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let isFPoint = ((f b) - b) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test x), false) in
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
(7,3)-(9,23)
(7,18)-(7,33)
(8,3)-(9,23)
(8,16)-(8,71)
(8,20)-(8,71)
(8,23)-(8,31)
(8,23)-(8,33)
(8,54)-(8,71)
(8,55)-(8,63)
(8,56)-(8,60)
*)
