
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
    let args = failwith List.combine (l1 l2) in
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
(22,16)-(22,24)
(22,16)-(22,44)
(22,39)-(22,44)
(23,5)-(23,52)
(23,49)-(23,52)
*)

(* type error slice
(4,4)-(7,70)
(4,13)-(7,66)
(4,16)-(7,66)
(5,3)-(7,66)
(6,11)-(6,62)
(6,11)-(6,67)
(6,58)-(6,59)
(13,3)-(24,33)
(13,12)-(23,52)
(14,5)-(23,52)
(14,11)-(20,42)
(18,12)-(20,42)
(18,12)-(20,42)
(18,18)-(18,19)
(22,16)-(22,24)
(22,16)-(22,44)
(22,25)-(22,37)
(22,39)-(22,41)
(22,39)-(22,44)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
*)
