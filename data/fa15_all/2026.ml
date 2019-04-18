
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
    let f a x = match x with | (x,y) -> (1, ((x + y) :: a)) in
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
(16,17)-(16,60)
match a with
| (w , z) -> match x with
             | (x , y) -> (((x + y) + w) / 10 , (((x + y) + w) mod 10) :: z)
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])

(17,16)-(17,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

*)

(* type error slice
(16,5)-(19,52)
(16,11)-(16,60)
(16,13)-(16,60)
(16,17)-(16,60)
(16,41)-(16,60)
(16,45)-(16,59)
(16,57)-(16,58)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
*)
