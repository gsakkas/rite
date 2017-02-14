
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
               ((if addit > 10 then addit mod 10 else 0), ((addit / 10) ::
                 x))) in
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
(14,6)-(23,21)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(17,14)-(17,55)
(17,18)-(17,23)
(17,18)-(17,27)
(17,26)-(17,27)
(17,33)-(17,38)
(17,33)-(17,45)
(17,42)-(17,45)
(17,51)-(17,54)
(19,10)-(23,21)
(21,15)-(23,20)
(21,28)-(21,40)
(21,29)-(21,36)
(21,37)-(21,39)
(21,43)-(21,55)
(21,44)-(21,51)
(21,52)-(21,54)
(21,59)-(21,64)
(23,17)-(23,18)
(24,4)-(26,51)
(24,15)-(24,21)
(24,19)-(24,20)
(25,4)-(26,51)
(25,15)-(25,33)
(26,4)-(26,51)
(27,2)-(27,34)
*)

(* type error slice
(13,4)-(26,51)
(13,10)-(23,21)
(13,12)-(23,21)
(14,6)-(23,21)
(14,6)-(23,21)
(14,12)-(14,13)
(16,10)-(17,56)
(16,10)-(17,56)
(16,28)-(16,29)
(17,10)-(17,56)
(17,11)-(17,12)
(21,28)-(21,40)
(21,29)-(21,36)
(21,37)-(21,39)
(22,58)-(23,19)
(23,17)-(23,18)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)
