
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
(18,10)-(20,42)
(22,15)-(22,23)
(22,15)-(22,44)
(22,37)-(22,44)
(23,4)-(23,51)
(23,48)-(23,51)
*)

(* type error slice
(4,3)-(7,69)
(4,12)-(7,67)
(4,15)-(7,67)
(5,2)-(7,67)
(6,7)-(6,67)
(6,8)-(6,62)
(6,57)-(6,58)
(13,2)-(24,34)
(13,11)-(23,51)
(14,4)-(23,51)
(14,10)-(20,42)
(18,10)-(20,42)
(18,10)-(20,42)
(18,17)-(18,18)
(22,15)-(22,23)
(22,15)-(22,44)
(22,24)-(22,36)
(22,37)-(22,44)
(22,38)-(22,40)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
*)
