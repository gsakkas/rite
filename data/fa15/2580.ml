
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      ([(x1 + x2) / 10], ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(20,23)
*)

(* type error slice
(17,4)-(23,51)
(17,10)-(20,59)
(17,12)-(20,59)
(18,6)-(20,59)
(19,6)-(20,59)
(19,6)-(20,59)
(19,20)-(19,21)
(20,6)-(20,59)
(20,7)-(20,23)
(20,28)-(20,37)
(20,29)-(20,31)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
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
(4,16)-(10,17)
(4,19)-(10,17)
(5,2)-(10,17)
(5,13)-(5,48)
(5,13)-(5,29)
(5,14)-(5,25)
(5,26)-(5,28)
(5,32)-(5,48)
(5,33)-(5,44)
(5,45)-(5,47)
(6,2)-(10,17)
(6,8)-(6,12)
(7,14)-(7,22)
(7,14)-(7,18)
(7,21)-(7,22)
(8,14)-(8,22)
(8,14)-(8,18)
(8,21)-(8,22)
(7,26)-(7,63)
(7,27)-(7,29)
(7,31)-(7,62)
(7,32)-(7,43)
(7,44)-(7,58)
(7,45)-(7,50)
(7,51)-(7,52)
(7,53)-(7,57)
(7,59)-(7,61)
(8,26)-(8,69)
(8,27)-(8,64)
(8,28)-(8,39)
(8,40)-(8,60)
(8,41)-(8,46)
(8,47)-(8,48)
(8,49)-(8,59)
(8,50)-(8,51)
(8,54)-(8,58)
(8,61)-(8,63)
(8,66)-(8,68)
(9,9)-(9,17)
(9,10)-(9,12)
(9,14)-(9,16)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(24,34)
(15,14)-(24,34)
(16,2)-(24,34)
(16,11)-(23,51)
(17,4)-(23,51)
(17,10)-(20,59)
(17,12)-(20,59)
(18,6)-(20,59)
(18,20)-(18,21)
(19,6)-(20,59)
(19,20)-(19,21)
(20,6)-(20,59)
(20,7)-(20,23)
(20,8)-(20,22)
(20,8)-(20,17)
(20,9)-(20,11)
(20,14)-(20,16)
(20,20)-(20,22)
(20,25)-(20,58)
(20,26)-(20,51)
(20,27)-(20,43)
(20,28)-(20,37)
(20,29)-(20,31)
(20,34)-(20,36)
(20,40)-(20,42)
(20,48)-(20,50)
(20,55)-(20,57)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,44)
(22,15)-(22,23)
(22,24)-(22,44)
(22,25)-(22,37)
(22,38)-(22,40)
(22,41)-(22,43)
(23,4)-(23,51)
(23,18)-(23,44)
(23,18)-(23,32)
(23,33)-(23,34)
(23,35)-(23,39)
(23,40)-(23,44)
(23,48)-(23,51)
(24,2)-(24,34)
(24,2)-(24,12)
(24,13)-(24,34)
(24,14)-(24,17)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
*)
