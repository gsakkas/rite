
let rec clone x n =
  let accum = [] in if n < 1 then [] else clone (x :: accum) (n - 1);;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,20)-(3,68)
fun x ->
  fun n ->
    if n < 1
    then accum
    else x :: accum
LamG (LamG EmptyG)

(3,20)-(3,68)
fun n ->
  if n < 1
  then accum
  else x :: accum
LamG (IteG EmptyG EmptyG EmptyG)

(3,20)-(3,68)
let helper =
  fun x ->
    fun n ->
      if n < 1
      then accum
      else x :: accum in
helper x (n - 1)
LetG NonRec [LamG EmptyG] (AppG [EmptyG,EmptyG])

(3,42)-(3,47)
accum
VarG

(3,61)-(3,68)
helper
VarG

(3,61)-(3,68)
x
VarG

(3,61)-(3,68)
helper x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
