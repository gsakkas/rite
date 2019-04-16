
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with
           | ([],[]) -> a
           | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          (match x with | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,11)-(19,64)
match x with
| (h1 , h2) -> ([(h1 + h2) / 10] , [(h1 + h2) mod 10])
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,57)
(2,40)-(2,57)
(2,41)-(2,46)
(2,47)-(2,48)
(4,4)-(7,80)
(4,13)-(7,78)
(4,16)-(7,78)
(5,3)-(7,78)
(6,22)-(6,69)
(6,23)-(6,28)
(6,29)-(6,30)
(7,8)-(7,78)
(7,13)-(7,77)
(7,14)-(7,25)
(7,26)-(7,73)
(7,27)-(7,32)
(13,3)-(23,35)
(13,12)-(22,52)
(14,5)-(22,52)
(14,11)-(19,64)
(14,13)-(19,64)
(17,11)-(19,64)
(17,18)-(17,19)
(19,27)-(19,36)
(19,28)-(19,30)
(21,5)-(22,52)
(21,16)-(21,28)
(21,16)-(21,34)
(21,32)-(21,34)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,41)-(22,45)
(23,14)-(23,35)
(23,15)-(23,18)
(23,19)-(23,34)
(23,20)-(23,27)
*)
