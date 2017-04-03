
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = let (pos,total) = a in ((pos + 1), (mulByDigit (10 ** pos) l2)) in
  let base = (0, [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pos,total) = a in
    ((pos + 1), (mulByDigit (int_of_float (10.0 ** (float_of_int pos))) l2)) in
  let base = (0, [0]) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(32,61)-(32,72)
(32,62)-(32,64)
(32,68)-(32,71)
*)

(* type error slice
(32,61)-(32,72)
(32,62)-(32,64)
(32,65)-(32,67)
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
(4,16)-(8,57)
(4,19)-(8,57)
(5,2)-(8,57)
(5,17)-(5,52)
(5,17)-(5,33)
(5,18)-(5,29)
(5,30)-(5,32)
(5,36)-(5,52)
(5,37)-(5,48)
(5,49)-(5,51)
(6,2)-(8,57)
(6,5)-(6,17)
(6,5)-(6,13)
(6,16)-(6,17)
(7,7)-(7,48)
(7,8)-(7,10)
(7,12)-(7,47)
(7,13)-(7,24)
(7,25)-(7,43)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,42)
(7,44)-(7,46)
(8,7)-(8,57)
(8,8)-(8,52)
(8,9)-(8,20)
(8,21)-(8,48)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,47)
(8,31)-(8,35)
(8,38)-(8,46)
(8,49)-(8,51)
(8,54)-(8,56)
(10,19)-(11,74)
(11,2)-(11,74)
(11,8)-(11,9)
(11,23)-(11,25)
(11,36)-(11,74)
(11,39)-(11,44)
(11,39)-(11,40)
(11,43)-(11,44)
(11,50)-(11,62)
(11,50)-(11,60)
(11,61)-(11,62)
(11,68)-(11,74)
(11,68)-(11,69)
(11,73)-(11,74)
(13,11)-(26,34)
(13,14)-(26,34)
(14,2)-(26,34)
(14,11)-(25,51)
(15,4)-(25,51)
(15,10)-(22,31)
(15,12)-(22,31)
(16,6)-(22,31)
(16,12)-(16,13)
(18,10)-(22,31)
(18,17)-(18,18)
(20,15)-(21,63)
(20,25)-(20,39)
(20,25)-(20,34)
(20,26)-(20,28)
(20,31)-(20,33)
(20,37)-(20,39)
(21,15)-(21,63)
(21,16)-(21,26)
(21,17)-(21,20)
(21,23)-(21,25)
(21,28)-(21,62)
(21,29)-(21,39)
(21,30)-(21,33)
(21,36)-(21,38)
(21,43)-(21,61)
(21,43)-(21,55)
(21,44)-(21,47)
(21,52)-(21,54)
(21,59)-(21,61)
(22,22)-(22,30)
(22,23)-(22,24)
(22,26)-(22,29)
(22,27)-(22,28)
(23,4)-(25,51)
(23,15)-(23,23)
(23,16)-(23,17)
(23,19)-(23,22)
(23,20)-(23,21)
(24,4)-(25,51)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,19)-(29,63)
(28,21)-(29,63)
(29,2)-(29,63)
(29,8)-(29,9)
(29,22)-(29,24)
(29,32)-(29,63)
(29,32)-(29,38)
(29,39)-(29,40)
(29,41)-(29,63)
(29,42)-(29,52)
(29,53)-(29,60)
(29,54)-(29,55)
(29,58)-(29,59)
(29,61)-(29,62)
(31,11)-(34,75)
(31,14)-(34,75)
(32,2)-(34,75)
(32,8)-(32,77)
(32,10)-(32,77)
(32,14)-(32,77)
(32,32)-(32,33)
(32,37)-(32,77)
(32,38)-(32,47)
(32,39)-(32,42)
(32,45)-(32,46)
(32,49)-(32,76)
(32,50)-(32,60)
(32,61)-(32,72)
(32,65)-(32,67)
(32,62)-(32,64)
(32,68)-(32,71)
(32,73)-(32,75)
(33,2)-(34,75)
(33,13)-(33,21)
(33,14)-(33,15)
(33,17)-(33,20)
(33,18)-(33,19)
(34,2)-(34,75)
(34,13)-(34,24)
(34,13)-(34,21)
(34,22)-(34,24)
(34,28)-(34,75)
(34,42)-(34,68)
(34,42)-(34,56)
(34,57)-(34,58)
(34,59)-(34,63)
(34,64)-(34,68)
(34,72)-(34,75)
*)
