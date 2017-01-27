
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | [] -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.combine (l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,12)-(20,42)
(22,16)-(22,28)
(22,30)-(22,35)
(23,5)-(23,52)
(23,49)-(23,52)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(7,70)
(4,13)-(7,66)
(4,16)-(7,66)
(5,3)-(7,66)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,11)-(6,16)
(6,11)-(6,54)
(6,11)-(6,62)
(6,11)-(6,67)
(6,17)-(6,18)
(6,21)-(6,54)
(6,58)-(6,59)
(6,60)-(6,62)
(6,65)-(6,67)
(13,3)-(24,33)
(13,12)-(23,52)
(14,5)-(23,52)
(14,11)-(20,42)
(14,13)-(20,42)
(15,7)-(20,42)
(15,13)-(15,14)
(17,11)-(20,42)
(17,21)-(17,22)
(17,21)-(17,26)
(17,25)-(17,26)
(18,12)-(20,42)
(18,18)-(18,19)
(19,24)-(19,65)
(21,5)-(23,52)
(21,16)-(21,18)
(22,5)-(23,52)
(22,16)-(22,28)
(22,16)-(22,35)
(22,30)-(22,32)
(22,30)-(22,35)
(22,33)-(22,35)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,52)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
*)
