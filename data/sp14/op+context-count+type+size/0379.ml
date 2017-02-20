
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
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) -> (w, (bigAdd y (mulByDigit (x * (10 ** (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let rec mulByTen n =
  match n with | 0 -> 0 | 1 -> 10 | _ -> 10 * (mulByTen (n - 1));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) ->
        (w, (bigAdd y (mulByDigit (x * (mulByTen (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,11)-(39,75)
(35,2)-(39,75)
(37,46)-(37,69)
(37,47)-(37,49)
(37,50)-(37,52)
(37,54)-(37,65)
(38,2)-(39,75)
(39,2)-(39,75)
(39,13)-(39,21)
(39,13)-(39,24)
(39,22)-(39,24)
(39,28)-(39,75)
(39,42)-(39,56)
(39,42)-(39,68)
(39,57)-(39,58)
(39,59)-(39,63)
(39,64)-(39,68)
(39,72)-(39,75)
*)

(* type error slice
(37,46)-(37,69)
(37,47)-(37,49)
(37,50)-(37,52)
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
(16,11)-(24,34)
(16,14)-(24,34)
(17,2)-(24,34)
(17,11)-(23,51)
(18,4)-(23,51)
(18,10)-(20,71)
(18,12)-(20,71)
(19,6)-(20,71)
(19,14)-(19,31)
(19,14)-(19,21)
(19,15)-(19,18)
(19,19)-(19,20)
(19,24)-(19,31)
(19,25)-(19,28)
(19,29)-(19,30)
(20,6)-(20,71)
(20,12)-(20,13)
(20,30)-(20,71)
(20,31)-(20,45)
(20,32)-(20,39)
(20,33)-(20,34)
(20,37)-(20,38)
(20,42)-(20,44)
(20,47)-(20,70)
(20,48)-(20,64)
(20,49)-(20,56)
(20,50)-(20,51)
(20,54)-(20,55)
(20,61)-(20,63)
(20,68)-(20,69)
(21,4)-(23,51)
(21,15)-(21,22)
(21,16)-(21,17)
(21,19)-(21,21)
(22,4)-(23,51)
(22,15)-(22,57)
(22,47)-(22,48)
(22,15)-(22,46)
(22,16)-(22,24)
(22,25)-(22,45)
(22,26)-(22,38)
(22,39)-(22,41)
(22,42)-(22,44)
(22,49)-(22,57)
(22,50)-(22,56)
(22,51)-(22,52)
(22,54)-(22,55)
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
(26,19)-(32,15)
(26,21)-(32,15)
(27,2)-(32,15)
(27,16)-(31,41)
(27,18)-(31,41)
(27,21)-(31,41)
(28,4)-(31,41)
(28,10)-(28,11)
(29,11)-(29,14)
(29,12)-(29,13)
(30,11)-(30,22)
(30,11)-(30,17)
(30,18)-(30,20)
(30,21)-(30,22)
(31,11)-(31,41)
(31,11)-(31,16)
(31,17)-(31,24)
(31,18)-(31,19)
(31,22)-(31,23)
(31,25)-(31,27)
(31,28)-(31,41)
(31,29)-(31,35)
(31,36)-(31,37)
(31,38)-(31,40)
(32,2)-(32,15)
(32,2)-(32,7)
(32,8)-(32,9)
(32,10)-(32,11)
(32,12)-(32,15)
(32,13)-(32,14)
(34,11)-(39,75)
(34,14)-(39,75)
(35,2)-(39,75)
(35,8)-(37,76)
(35,10)-(37,76)
(36,4)-(37,76)
(36,10)-(36,11)
(37,15)-(37,76)
(37,16)-(37,17)
(37,19)-(37,75)
(37,20)-(37,26)
(37,27)-(37,28)
(37,29)-(37,74)
(37,30)-(37,40)
(37,41)-(37,70)
(37,42)-(37,43)
(37,46)-(37,69)
(37,50)-(37,52)
(37,47)-(37,49)
(37,53)-(37,68)
(37,54)-(37,65)
(37,66)-(37,67)
(37,71)-(37,73)
(38,2)-(39,75)
(38,13)-(38,20)
(38,14)-(38,15)
(38,17)-(38,19)
(39,2)-(39,75)
(39,13)-(39,24)
(39,13)-(39,21)
(39,22)-(39,24)
(39,28)-(39,75)
(39,42)-(39,68)
(39,42)-(39,56)
(39,57)-(39,58)
(39,59)-(39,63)
(39,64)-(39,68)
(39,72)-(39,75)
*)
