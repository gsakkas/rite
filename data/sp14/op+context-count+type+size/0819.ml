
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = x in
      let (l1',l2') = a in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((addit / 10), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,24)-(14,25)
(15,6)-(17,45)
(16,6)-(17,45)
*)

(* type error slice
(13,4)-(20,51)
(13,10)-(17,45)
(13,12)-(17,45)
(14,6)-(17,45)
(15,6)-(17,45)
(15,6)-(17,45)
(15,22)-(15,23)
(16,6)-(17,45)
(16,18)-(16,29)
(16,25)-(16,28)
(17,6)-(17,45)
(17,21)-(17,44)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
*)
