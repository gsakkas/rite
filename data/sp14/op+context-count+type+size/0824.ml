
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
      if addit >= 10 then 1 else (0, (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (car,res) = List.fold_left f base args in res in
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
      ((if addit >= 10 then 1 else 0), (num @ [addit mod 10])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (car,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,7)-(17,59)
(17,35)-(17,59)
*)

(* type error slice
(13,5)-(20,54)
(13,11)-(17,59)
(13,13)-(17,59)
(14,7)-(17,59)
(14,7)-(17,59)
(14,25)-(14,26)
(15,7)-(17,59)
(16,7)-(17,59)
(17,7)-(17,59)
(17,7)-(17,59)
(17,27)-(17,28)
(17,35)-(17,59)
(20,21)-(20,35)
(20,21)-(20,47)
(20,36)-(20,37)
*)
