
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let l1 = List.length l1 in
  let l2 = List.length l2 in
  (((clone 0 (l2 - l1)) @ l1), ((clone 0 (l1 - l2)) @ l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

*)

(* changed spans
(6,2)-(8,58)
let ll1 = List.length l1 in
let ll2 = List.length l2 in
(clone 0
       (ll2 - ll1) @ l1 , clone 0
                                (ll1 - ll2) @ l2)
LetG NonRec [AppG [EmptyG]] (LetG NonRec [EmptyG] EmptyG)

(7,2)-(8,58)
let ll2 = List.length l2 in
(clone 0
       (ll2 - ll1) @ l1 , clone 0
                                (ll1 - ll2) @ l2)
LetG NonRec [AppG [EmptyG]] (TupleG [EmptyG,EmptyG])

(8,19)-(8,21)
ll2
VarG

(8,26)-(8,28)
ll1
VarG

(8,47)-(8,49)
ll1
VarG

(8,54)-(8,56)
ll2
VarG

*)
