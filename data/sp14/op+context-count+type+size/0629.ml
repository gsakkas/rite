
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | x::xs -> if x = 0 then removeZero xs else l | [] -> [];;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "tba" in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,2)-(17,71)
(17,26)-(17,60)
(17,29)-(17,30)
(17,51)-(17,53)
(17,69)-(17,71)
(21,16)-(21,24)
(21,16)-(21,30)
(21,25)-(21,30)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,23)
(23,15)-(23,43)
(23,24)-(23,43)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,12)
(25,2)-(25,34)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

(* type error slice
(22,4)-(24,51)
(22,15)-(22,17)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,35)-(24,39)
*)
