
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
(15,6)-(23,69)
(15,12)-(15,13)
(17,10)-(23,69)
(17,17)-(17,18)
(19,15)-(20,53)
(19,16)-(19,49)
(19,17)-(19,41)
(19,18)-(19,35)
(19,19)-(19,28)
(19,20)-(19,22)
(19,25)-(19,27)
(19,31)-(19,34)
(19,38)-(19,40)
(19,45)-(19,48)
(20,17)-(20,52)
(20,18)-(20,44)
(20,19)-(20,36)
(20,20)-(20,29)
(20,21)-(20,23)
(20,26)-(20,28)
(20,32)-(20,35)
(20,41)-(20,43)
(20,48)-(20,51)
(22,15)-(23,68)
(23,31)-(23,40)
(23,31)-(23,45)
(23,32)-(23,34)
(23,37)-(23,39)
(23,43)-(23,45)
(24,4)-(26,51)
(27,2)-(27,34)
*)

(* type error slice
(17,10)-(23,69)
(17,10)-(23,69)
(17,17)-(17,18)
(22,15)-(23,68)
(22,22)-(22,23)
(23,31)-(23,40)
(23,32)-(23,34)
*)
