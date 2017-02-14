
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | [] -> a
      | h::t ->
          ((((fst h) + (snd h)) / 10), ((((fst h) + (snd h)) mod 10) :: t)) in
    let base = (0, []) in
    let args = [((List.combine l1), l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(18,75)
(15,12)-(15,13)
(18,10)-(18,75)
(18,11)-(18,37)
(18,12)-(18,31)
(18,13)-(18,20)
(18,14)-(18,17)
(18,18)-(18,19)
(18,23)-(18,30)
(18,24)-(18,27)
(18,28)-(18,29)
(18,34)-(18,36)
(18,39)-(18,74)
(18,40)-(18,68)
(18,41)-(18,60)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,52)-(18,59)
(18,53)-(18,56)
(18,57)-(18,58)
(18,65)-(18,67)
(18,72)-(18,73)
(19,4)-(21,51)
(19,15)-(19,22)
(20,4)-(21,51)
*)

(* type error slice
(15,6)-(18,75)
(15,6)-(18,75)
(18,23)-(18,30)
(18,24)-(18,27)
(18,28)-(18,29)
(18,39)-(18,74)
(18,39)-(18,74)
(18,40)-(18,68)
(18,72)-(18,73)
*)
