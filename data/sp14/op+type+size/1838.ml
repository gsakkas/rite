
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g::[]) -> f in
      let digit =
        match x with
        | (f,g) ->
            if ((f + g) + carry) > 9
            then (1, ((f + g) + (carry mod 10)))
            else (0, ((f + g) + (carry mod 10))) in
      digit in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,g) -> f in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> (f + g) + (carry mod 10) in
      match a with | (o,p) -> (newc, (digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,18)-(16,47)
(17,6)-(23,11)
(21,17)-(21,48)
(21,21)-(21,47)
(21,22)-(21,29)
(21,23)-(21,24)
(21,27)-(21,28)
(21,32)-(21,46)
(21,33)-(21,38)
(21,43)-(21,45)
(22,17)-(22,48)
(22,21)-(22,47)
(23,6)-(23,11)
(24,4)-(26,51)
(24,15)-(24,22)
(25,4)-(26,51)
(26,4)-(26,51)
*)

(* type error slice
(15,4)-(26,51)
(15,10)-(23,11)
(15,12)-(23,11)
(16,6)-(23,11)
(16,18)-(16,47)
(16,18)-(16,47)
(16,24)-(16,25)
(17,6)-(23,11)
(17,6)-(23,11)
(18,8)-(22,48)
(20,12)-(22,48)
(21,17)-(21,48)
(21,21)-(21,47)
(23,6)-(23,11)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)

(* all spans
(2,14)-(3,77)
(2,16)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,77)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,77)
(3,72)-(3,73)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(3,74)-(3,77)
(3,75)-(3,76)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
(8,7)-(8,77)
(8,8)-(8,72)
(8,9)-(8,20)
(8,21)-(8,68)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,67)
(8,31)-(8,47)
(8,32)-(8,43)
(8,44)-(8,46)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(8,69)-(8,71)
(8,74)-(8,76)
(10,19)-(11,68)
(11,2)-(11,68)
(11,8)-(11,9)
(11,23)-(11,24)
(11,35)-(11,68)
(11,38)-(11,43)
(11,38)-(11,39)
(11,42)-(11,43)
(11,49)-(11,61)
(11,49)-(11,59)
(11,60)-(11,61)
(11,67)-(11,68)
(13,11)-(27,34)
(13,14)-(27,34)
(14,2)-(27,34)
(14,11)-(26,51)
(15,4)-(26,51)
(15,10)-(23,11)
(15,12)-(23,11)
(16,6)-(23,11)
(16,18)-(16,47)
(16,24)-(16,25)
(16,46)-(16,47)
(17,6)-(23,11)
(18,8)-(22,48)
(18,14)-(18,15)
(20,12)-(22,48)
(20,15)-(20,36)
(20,15)-(20,32)
(20,16)-(20,23)
(20,17)-(20,18)
(20,21)-(20,22)
(20,26)-(20,31)
(20,35)-(20,36)
(21,17)-(21,48)
(21,18)-(21,19)
(21,21)-(21,47)
(21,22)-(21,29)
(21,23)-(21,24)
(21,27)-(21,28)
(21,32)-(21,46)
(21,33)-(21,38)
(21,43)-(21,45)
(22,17)-(22,48)
(22,18)-(22,19)
(22,21)-(22,47)
(22,22)-(22,29)
(22,23)-(22,24)
(22,27)-(22,28)
(22,32)-(22,46)
(22,33)-(22,38)
(22,43)-(22,45)
(23,6)-(23,11)
(24,4)-(26,51)
(24,15)-(24,22)
(24,16)-(24,17)
(24,19)-(24,21)
(25,4)-(26,51)
(25,15)-(25,44)
(25,15)-(25,23)
(25,24)-(25,44)
(25,25)-(25,37)
(25,38)-(25,40)
(25,41)-(25,43)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)
