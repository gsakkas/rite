
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (w,y)::t -> ((w + y) / 10) :: a :: ((w + y) mod 10)
      | _ -> a in
    let base = [] in
    let args = List.rev ((List.combine l1 l2) :: (0, 0)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,14)
(19,12)-(19,13)
(20,20)-(20,34)
(20,20)-(20,59)
(20,26)-(20,27)
(20,38)-(20,39)
(20,49)-(20,50)
(21,13)-(21,14)
(22,15)-(22,17)
(23,24)-(23,56)
(23,49)-(23,55)
(23,50)-(23,51)
(23,53)-(23,54)
*)

(* type error slice
(18,4)-(24,51)
(18,10)-(21,14)
(18,12)-(21,14)
(19,6)-(21,14)
(19,6)-(21,14)
(20,20)-(20,59)
(20,20)-(20,59)
(20,38)-(20,39)
(20,38)-(20,59)
(20,38)-(20,59)
(20,38)-(20,59)
(20,43)-(20,59)
(21,13)-(21,14)
(23,24)-(23,56)
(23,49)-(23,55)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(11,45)
(4,15)-(11,45)
(5,2)-(11,45)
(5,11)-(5,46)
(5,11)-(5,27)
(5,12)-(5,23)
(5,24)-(5,26)
(5,30)-(5,46)
(5,31)-(5,42)
(5,43)-(5,45)
(6,2)-(11,45)
(6,8)-(6,10)
(7,9)-(7,17)
(7,10)-(7,12)
(7,14)-(7,16)
(9,6)-(11,45)
(9,9)-(9,15)
(9,9)-(9,11)
(9,14)-(9,15)
(10,11)-(10,36)
(10,12)-(10,14)
(10,16)-(10,35)
(10,30)-(10,31)
(10,17)-(10,29)
(10,18)-(10,23)
(10,24)-(10,25)
(10,26)-(10,28)
(10,32)-(10,34)
(11,11)-(11,45)
(11,12)-(11,40)
(11,35)-(11,36)
(11,13)-(11,34)
(11,14)-(11,19)
(11,20)-(11,21)
(11,22)-(11,33)
(11,23)-(11,25)
(11,28)-(11,32)
(11,37)-(11,39)
(11,42)-(11,44)
(13,19)-(14,75)
(14,2)-(14,75)
(14,8)-(14,9)
(14,23)-(14,25)
(14,36)-(14,75)
(14,39)-(14,45)
(14,39)-(14,40)
(14,44)-(14,45)
(14,51)-(14,63)
(14,51)-(14,61)
(14,62)-(14,63)
(14,69)-(14,75)
(14,69)-(14,70)
(14,74)-(14,75)
(16,11)-(25,34)
(16,14)-(25,34)
(17,2)-(25,34)
(17,11)-(24,51)
(18,4)-(24,51)
(18,10)-(21,14)
(18,12)-(21,14)
(19,6)-(21,14)
(19,12)-(19,13)
(20,20)-(20,59)
(20,20)-(20,34)
(20,21)-(20,28)
(20,22)-(20,23)
(20,26)-(20,27)
(20,31)-(20,33)
(20,38)-(20,59)
(20,38)-(20,39)
(20,43)-(20,59)
(20,44)-(20,51)
(20,45)-(20,46)
(20,49)-(20,50)
(20,56)-(20,58)
(21,13)-(21,14)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,56)
(23,15)-(23,23)
(23,24)-(23,56)
(23,25)-(23,45)
(23,26)-(23,38)
(23,39)-(23,41)
(23,42)-(23,44)
(23,49)-(23,55)
(23,50)-(23,51)
(23,53)-(23,54)
(24,4)-(24,51)
(24,18)-(24,44)
(24,18)-(24,32)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,34)
(25,2)-(25,12)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)
