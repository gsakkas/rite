
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = 1 in if (sumList (digitsOfInt n)) > 9 then count = (count + 1);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList count;;

*)

(* changed spans
(11,14)-(11,15)
[0]
ListG LitG Nothing

(11,19)-(11,76)
0
LitG

(11,65)-(11,76)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

(11,66)-(11,71)
additivePersistence
VarG

(11,66)-(11,71)
sumList
VarG

(11,66)-(11,71)
digitsOfInt
VarG

(11,66)-(11,71)
n
VarG

(11,66)-(11,71)
sumList
VarG

(11,66)-(11,71)
sumList (digitsOfInt n)
AppG [AppG [EmptyG]]

(11,66)-(11,71)
digitsOfInt n
AppG [VarG]

(11,66)-(11,71)
sumList count
AppG [VarG]

*)
