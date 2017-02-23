
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
      match x with
      | _ -> [a mod 10]
      | h::t -> ((a + h) mod 10) :: ((a + h) / 10) in
    let base = (0, 0) in
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
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(18,50)
(16,12)-(16,13)
(17,13)-(17,23)
(17,14)-(17,15)
(17,14)-(17,22)
(17,20)-(17,22)
(18,16)-(18,50)
(18,18)-(18,19)
(18,22)-(18,23)
(18,29)-(18,31)
(18,36)-(18,50)
(18,38)-(18,39)
(18,42)-(18,43)
(18,47)-(18,49)
(19,4)-(21,51)
(19,15)-(19,21)
(19,16)-(19,17)
(19,19)-(19,20)
(20,4)-(21,51)
(20,15)-(20,44)
(21,4)-(21,51)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(15,4)-(21,51)
(15,10)-(18,50)
(15,12)-(18,50)
(16,6)-(18,50)
(17,13)-(17,23)
(17,14)-(17,15)
(17,14)-(17,22)
(18,16)-(18,50)
(18,36)-(18,50)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
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
(13,11)-(22,34)
(13,14)-(22,34)
(14,2)-(22,34)
(14,11)-(21,51)
(15,4)-(21,51)
(15,10)-(18,50)
(15,12)-(18,50)
(16,6)-(18,50)
(16,12)-(16,13)
(17,13)-(17,23)
(17,14)-(17,22)
(17,14)-(17,15)
(17,20)-(17,22)
(18,16)-(18,50)
(18,16)-(18,32)
(18,17)-(18,24)
(18,18)-(18,19)
(18,22)-(18,23)
(18,29)-(18,31)
(18,36)-(18,50)
(18,37)-(18,44)
(18,38)-(18,39)
(18,42)-(18,43)
(18,47)-(18,49)
(19,4)-(21,51)
(19,15)-(19,21)
(19,16)-(19,17)
(19,19)-(19,20)
(20,4)-(21,51)
(20,15)-(20,44)
(20,15)-(20,23)
(20,24)-(20,44)
(20,25)-(20,37)
(20,38)-(20,40)
(20,41)-(20,43)
(21,4)-(21,51)
(21,18)-(21,44)
(21,18)-(21,32)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,34)
(22,2)-(22,12)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)
