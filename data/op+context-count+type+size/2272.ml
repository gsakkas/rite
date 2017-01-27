
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
(15,7)-(19,19)
(15,13)-(15,14)
(18,15)-(18,18)
(18,15)-(18,20)
(18,15)-(18,30)
(18,15)-(18,37)
(18,15)-(19,19)
(18,19)-(18,20)
(18,25)-(18,28)
(18,25)-(18,30)
(18,29)-(18,30)
(18,35)-(18,37)
(18,44)-(18,47)
(18,44)-(18,49)
(18,44)-(18,59)
(18,44)-(18,68)
(18,44)-(19,19)
(18,48)-(18,49)
(18,54)-(18,57)
(18,54)-(18,59)
(18,58)-(18,59)
(18,66)-(18,68)
(19,14)-(19,17)
(19,14)-(19,19)
(19,18)-(19,19)
(20,5)-(22,52)
(23,3)-(23,33)
*)

(* type error slice
(14,5)-(22,52)
(14,11)-(19,19)
(14,13)-(19,19)
(15,7)-(19,19)
(15,13)-(15,14)
(16,15)-(16,16)
(19,14)-(19,17)
(19,14)-(19,19)
(19,18)-(19,19)
(20,5)-(22,52)
(20,17)-(20,18)
(20,17)-(20,22)
(20,20)-(20,22)
(21,5)-(22,52)
(21,16)-(21,41)
(21,19)-(21,31)
(21,19)-(21,34)
(21,19)-(21,39)
(21,32)-(21,34)
(21,37)-(21,39)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
*)
