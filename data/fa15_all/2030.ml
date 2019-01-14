
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> b @ ((w mod 10) :: ((y + z), (w / 10))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((y + z), (b @ ([w mod 10] @ [w / 10]))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,12)-(17,18)
y
VarG

(17,12)-(17,18)
z
VarG

(17,12)-(17,18)
y + z
BopG VarG VarG

(17,12)-(17,18)
(y + z , b @ ([w mod 10] @ [w / 10]))
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(18,27)-(18,28)
(@)
VarG

(18,27)-(18,28)
[w mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(18,29)-(18,64)
[w mod 10] @ [w / 10]
AppG (fromList [ListG EmptyG Nothing])

(18,50)-(18,51)
[w / 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
