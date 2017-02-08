
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          let (carry,num) = x in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          (match x with
           | (carry,num) ->
               let addit = ((List.hd l1) + (List.hd l2)) + carry in
               if addit > 10 then addit mod 10 else (0, ((addit / 10) :: x))) in
    let base = (0, 0) in
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
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,7)-(22,75)
(16,11)-(17,55)
(16,29)-(16,30)
(17,12)-(17,13)
(17,12)-(17,55)
(17,16)-(17,55)
(17,19)-(17,24)
(17,19)-(17,28)
(17,27)-(17,28)
(17,34)-(17,39)
(17,34)-(17,46)
(17,43)-(17,46)
(17,52)-(17,55)
(19,12)-(22,75)
(21,16)-(22,75)
(21,30)-(21,37)
(21,30)-(21,40)
(21,38)-(21,40)
(21,45)-(21,52)
(21,45)-(21,55)
(21,53)-(21,55)
(21,60)-(21,65)
(22,16)-(22,75)
(22,54)-(22,75)
(22,74)-(22,75)
(23,5)-(25,52)
(23,17)-(23,21)
(23,20)-(23,21)
(24,5)-(25,52)
(24,16)-(24,34)
(25,5)-(25,52)
(26,3)-(26,33)
*)

(* type error slice
(13,5)-(25,52)
(13,11)-(22,75)
(13,13)-(22,75)
(14,7)-(22,75)
(14,7)-(22,75)
(14,7)-(22,75)
(14,13)-(14,14)
(16,11)-(17,55)
(16,11)-(17,55)
(16,29)-(16,30)
(17,12)-(17,13)
(17,12)-(17,55)
(19,12)-(22,75)
(21,16)-(22,75)
(21,30)-(21,37)
(21,30)-(21,40)
(21,38)-(21,40)
(22,16)-(22,75)
(22,16)-(22,75)
(22,35)-(22,47)
(22,54)-(22,75)
(22,59)-(22,75)
(22,74)-(22,75)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
*)
