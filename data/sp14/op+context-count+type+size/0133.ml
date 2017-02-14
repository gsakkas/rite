
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
      | (lh1::lt1,lh2::lt2) ->
          (match x with
           | (h1,h2) ->
               (((((h1 + h2) + lh1) / 10) :: lt1),
                 ((((h1 + h2) + lh1) mod 10) :: lt2))
           | ([],[]) ->
               (match x with
                | (h1,h2) -> ([(h1 + h2) / 10], [(h1 + h2) mod 10]))) in
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
    let f a x = match x with | (v1,v2) -> ([v1], [v2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(23,67)
(15,13)-(15,14)
(17,12)-(23,67)
(17,18)-(17,19)
(19,21)-(19,23)
(19,21)-(19,28)
(19,21)-(19,35)
(19,21)-(19,41)
(19,21)-(19,49)
(19,21)-(20,52)
(19,26)-(19,28)
(19,32)-(19,35)
(19,39)-(19,41)
(19,46)-(19,49)
(20,22)-(20,24)
(20,22)-(20,29)
(20,22)-(20,36)
(20,22)-(20,44)
(20,22)-(20,52)
(20,27)-(20,29)
(20,33)-(20,36)
(20,42)-(20,44)
(20,49)-(20,52)
(22,17)-(23,67)
(23,33)-(23,35)
(23,33)-(23,40)
(23,33)-(23,46)
(23,38)-(23,40)
(23,44)-(23,46)
(24,5)-(26,52)
(27,3)-(27,33)
*)

(* type error slice
(17,12)-(23,67)
(17,12)-(23,67)
(17,18)-(17,19)
(22,17)-(23,67)
(22,23)-(22,24)
(23,33)-(23,35)
(23,33)-(23,40)
*)
