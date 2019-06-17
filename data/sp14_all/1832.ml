
let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;


(* fix

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> list1 :: list2;;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append [] t);;

let append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (append t [h]);;

*)

(* changed spans
(4,1)-(4,1)
fun list1 ->
  fun list2 ->
    match list1 with
    | [] -> list2
    | h :: t -> list1 :: list2
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,44)-(3,49)
h
VarG

(3,53)-(3,58)
append [] t
AppG [ListG [],VarG]

(7,1)-(7,1)
fun list1 ->
  fun list2 ->
    match list1 with
    | [] -> list2
    | h :: t -> h :: (append t
                             list2)
LamG VarPatG (LamG EmptyPatG EmptyG)

*)

(* type error slice
(2,4)-(3,60)
(2,12)-(3,58)
(2,18)-(3,58)
(3,44)-(3,49)
(3,44)-(3,58)
(3,53)-(3,58)
(6,3)-(6,63)
(6,49)-(6,63)
(6,50)-(6,56)
(6,57)-(6,58)
(6,59)-(6,62)
(6,60)-(6,61)
*)
