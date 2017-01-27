
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
      | h::t -> ((((fst h) + (snd h)) / 10), (((fst h) + (snd h)) mod 10)) ::
          t in
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
(15,7)-(18,12)
(15,13)-(15,14)
(17,21)-(17,24)
(17,21)-(17,26)
(17,21)-(17,36)
(17,21)-(17,43)
(17,21)-(17,73)
(17,21)-(18,12)
(17,25)-(17,26)
(17,31)-(17,34)
(17,31)-(17,36)
(17,35)-(17,36)
(17,41)-(17,43)
(17,49)-(17,52)
(17,49)-(17,54)
(17,49)-(17,64)
(17,49)-(17,73)
(17,53)-(17,54)
(17,59)-(17,62)
(17,59)-(17,64)
(17,63)-(17,64)
(17,71)-(17,73)
(18,11)-(18,12)
(20,5)-(21,52)
(22,3)-(22,33)
*)

(* type error slice
(14,5)-(21,52)
(14,11)-(18,12)
(14,13)-(18,12)
(15,7)-(18,12)
(15,13)-(15,14)
(16,15)-(16,16)
(17,21)-(18,12)
(19,5)-(21,52)
(19,17)-(19,18)
(19,17)-(19,22)
(19,20)-(19,22)
(20,5)-(21,52)
(20,16)-(20,41)
(20,19)-(20,31)
(20,19)-(20,34)
(20,19)-(20,39)
(20,32)-(20,34)
(20,37)-(20,39)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
*)
