
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if x = ()
      then a
      else
        (match a with
         | (carry,rest) ->
             (match x with
              | (add1,add2) ->
                  ((((add1 + add2) + carry) / 10),
                    ((((add1 + add2) + carry) mod 10) :: rest)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(24,65)
(16,9)-(16,10)
(16,9)-(16,15)
(16,13)-(16,15)
(17,11)-(17,12)
*)

(* type error slice
(15,4)-(27,51)
(15,10)-(24,65)
(15,12)-(24,65)
(16,9)-(16,10)
(16,9)-(16,15)
(16,9)-(16,15)
(16,13)-(16,15)
(21,13)-(24,64)
(21,20)-(21,21)
(26,4)-(27,51)
(26,15)-(26,23)
(26,15)-(26,44)
(26,24)-(26,44)
(26,25)-(26,37)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,40)-(27,44)
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
(4,12)-(8,31)
(4,15)-(8,31)
(5,2)-(8,31)
(5,10)-(5,45)
(5,10)-(5,26)
(5,11)-(5,22)
(5,23)-(5,25)
(5,29)-(5,45)
(5,30)-(5,41)
(5,42)-(5,44)
(6,2)-(8,31)
(6,5)-(6,10)
(6,5)-(6,6)
(6,9)-(6,10)
(7,7)-(7,40)
(7,8)-(7,35)
(7,30)-(7,31)
(7,9)-(7,29)
(7,10)-(7,15)
(7,16)-(7,17)
(7,18)-(7,28)
(7,19)-(7,23)
(7,26)-(7,27)
(7,32)-(7,34)
(7,37)-(7,39)
(8,7)-(8,31)
(8,8)-(8,10)
(8,12)-(8,30)
(8,25)-(8,26)
(8,13)-(8,24)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,23)
(8,27)-(8,29)
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
(13,11)-(28,34)
(13,14)-(28,34)
(14,2)-(28,34)
(14,11)-(27,51)
(15,4)-(27,51)
(15,10)-(24,65)
(15,12)-(24,65)
(16,6)-(24,65)
(16,9)-(16,15)
(16,9)-(16,10)
(16,13)-(16,15)
(17,11)-(17,12)
(19,8)-(24,65)
(19,15)-(19,16)
(21,13)-(24,64)
(21,20)-(21,21)
(23,18)-(24,63)
(23,19)-(23,49)
(23,20)-(23,43)
(23,21)-(23,34)
(23,22)-(23,26)
(23,29)-(23,33)
(23,37)-(23,42)
(23,46)-(23,48)
(24,20)-(24,62)
(24,21)-(24,53)
(24,22)-(24,45)
(24,23)-(24,36)
(24,24)-(24,28)
(24,31)-(24,35)
(24,39)-(24,44)
(24,50)-(24,52)
(24,57)-(24,61)
(25,4)-(27,51)
(25,15)-(25,22)
(25,16)-(25,17)
(25,19)-(25,21)
(26,4)-(27,51)
(26,15)-(26,44)
(26,15)-(26,23)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,44)
(27,18)-(27,32)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,34)
(28,2)-(28,12)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)
