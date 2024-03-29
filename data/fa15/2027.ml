
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
      match x with | (x,y) -> (((x + y) / 10), (((x + y) mod 10) :: a)) in
    let base = [] in
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
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,7)-(17,72)
match a with
| (w , z) -> match x with
             | (x , y) -> (((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])]

(18,16)-(18,18)
(0 , [])
TupleG [LitG,ListG []]

*)

(* type error slice
(16,5)-(20,52)
(16,11)-(17,72)
(16,13)-(17,72)
(17,7)-(17,72)
(17,31)-(17,72)
(17,48)-(17,71)
(17,69)-(17,70)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
*)
