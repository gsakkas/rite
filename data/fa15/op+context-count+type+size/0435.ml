
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with | (l1e,l2e) -> let num = (l1e + l2e) + a in (num, [7]) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2) (if l1 > l2 then l1 else l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(17,35)-(17,73)
(17,46)-(17,60)
(17,59)-(17,60)
(17,65)-(17,68)
(17,70)-(17,73)
(18,5)-(20,52)
(18,17)-(18,22)
(19,5)-(20,52)
(20,5)-(20,52)
(21,21)-(21,63)
(21,37)-(21,63)
(21,40)-(21,42)
(21,40)-(21,47)
(21,53)-(21,55)
(21,61)-(21,63)
*)

(* type error slice
(16,5)-(20,52)
(16,11)-(17,73)
(16,13)-(17,73)
(17,7)-(17,73)
(17,35)-(17,73)
(17,46)-(17,60)
(17,59)-(17,60)
(17,65)-(17,73)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
*)
