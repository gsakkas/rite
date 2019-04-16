
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (_,_) -> carry :: rest
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,11)-(22,62)
match x with
| (add1 , add2) -> (((add1 + add2) + carry) / 10 , (((add1 + add2) + carry) mod 10) :: rest)
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(15,5)-(25,52)
(15,11)-(22,62)
(15,13)-(22,62)
(16,7)-(22,62)
(16,13)-(16,14)
(18,11)-(22,62)
(19,23)-(19,36)
(21,16)-(22,61)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
*)
