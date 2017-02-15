
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
          ((((fst h) + (snd h)) / 10), ((((fst h) + (snd h)) mod 10) ::
            (snd a))) in
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
(15,6)-(19,21)
(15,12)-(15,13)
(18,10)-(19,21)
(18,11)-(18,37)
(18,12)-(18,31)
(18,13)-(18,20)
(18,14)-(18,17)
(18,18)-(18,19)
(18,23)-(18,30)
(18,24)-(18,27)
(18,28)-(18,29)
(18,34)-(18,36)
(18,39)-(19,20)
(18,40)-(18,68)
(18,41)-(18,60)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,52)-(18,59)
(18,53)-(18,56)
(18,57)-(18,58)
(18,65)-(18,67)
(19,12)-(19,19)
(19,13)-(19,16)
(19,17)-(19,18)
(20,4)-(22,51)
(20,16)-(20,17)
*)

(* type error slice
(14,4)-(22,51)
(14,10)-(19,21)
(14,12)-(19,21)
(15,6)-(19,21)
(15,6)-(19,21)
(15,12)-(15,13)
(21,4)-(22,51)
(21,15)-(21,40)
(21,15)-(21,40)
(21,16)-(21,39)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
*)
