
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,[]) -> (new_carry, (new_carry :: digit))
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  -> (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  | false  -> (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,[]) -> (new_carry, [new_carry; digit])
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,35)-(30,55)
*)

(* type error slice
(28,10)-(31,72)
(28,22)-(28,64)
(30,35)-(30,55)
(30,49)-(30,54)
*)

(* all spans
(2,14)-(7,23)
(2,16)-(7,23)
(3,2)-(7,23)
(3,22)-(6,47)
(3,25)-(6,47)
(4,4)-(6,47)
(4,10)-(4,16)
(4,10)-(4,12)
(4,15)-(4,16)
(5,15)-(5,17)
(6,16)-(6,47)
(6,16)-(6,18)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(6,38)-(6,46)
(6,39)-(6,41)
(6,44)-(6,45)
(7,2)-(7,23)
(7,2)-(7,13)
(7,14)-(7,15)
(7,16)-(7,23)
(7,17)-(7,20)
(7,21)-(7,22)
(9,12)-(12,74)
(9,15)-(12,74)
(10,2)-(12,74)
(10,8)-(10,43)
(10,8)-(10,24)
(10,9)-(10,20)
(10,21)-(10,23)
(10,27)-(10,43)
(10,28)-(10,39)
(10,40)-(10,42)
(11,13)-(11,73)
(11,14)-(11,16)
(11,18)-(11,72)
(11,67)-(11,68)
(11,19)-(11,66)
(11,20)-(11,25)
(11,26)-(11,27)
(11,28)-(11,65)
(11,29)-(11,45)
(11,30)-(11,41)
(11,42)-(11,44)
(11,48)-(11,64)
(11,49)-(11,60)
(11,61)-(11,63)
(11,69)-(11,71)
(12,14)-(12,74)
(12,15)-(12,69)
(12,64)-(12,65)
(12,16)-(12,63)
(12,17)-(12,22)
(12,23)-(12,24)
(12,25)-(12,62)
(12,26)-(12,42)
(12,27)-(12,38)
(12,39)-(12,41)
(12,45)-(12,61)
(12,46)-(12,57)
(12,58)-(12,60)
(12,66)-(12,68)
(12,71)-(12,73)
(14,19)-(19,12)
(15,2)-(19,12)
(15,19)-(18,56)
(16,4)-(18,56)
(16,10)-(16,15)
(17,12)-(17,14)
(18,16)-(18,56)
(18,19)-(18,25)
(18,19)-(18,21)
(18,24)-(18,25)
(18,31)-(18,42)
(18,31)-(18,39)
(18,40)-(18,42)
(18,48)-(18,56)
(18,48)-(18,50)
(18,54)-(18,56)
(19,2)-(19,12)
(19,2)-(19,10)
(19,11)-(19,12)
(21,11)-(35,34)
(21,14)-(35,34)
(22,2)-(35,34)
(22,11)-(34,51)
(23,4)-(34,51)
(23,10)-(31,72)
(23,12)-(31,72)
(24,6)-(31,72)
(24,12)-(24,13)
(26,10)-(31,72)
(26,26)-(26,51)
(26,32)-(26,33)
(26,50)-(26,51)
(27,10)-(31,72)
(27,26)-(27,66)
(27,26)-(27,61)
(27,27)-(27,49)
(27,28)-(27,37)
(27,40)-(27,48)
(27,52)-(27,60)
(27,64)-(27,66)
(28,10)-(31,72)
(28,22)-(28,64)
(28,22)-(28,57)
(28,23)-(28,45)
(28,24)-(28,33)
(28,36)-(28,44)
(28,48)-(28,56)
(28,62)-(28,64)
(29,10)-(31,72)
(29,17)-(29,18)
(30,23)-(30,56)
(30,24)-(30,33)
(30,35)-(30,55)
(30,36)-(30,45)
(30,49)-(30,54)
(31,28)-(31,71)
(31,29)-(31,38)
(31,40)-(31,70)
(31,41)-(31,50)
(31,54)-(31,69)
(31,54)-(31,59)
(31,63)-(31,69)
(31,63)-(31,64)
(31,68)-(31,69)
(32,4)-(34,51)
(32,15)-(32,22)
(32,16)-(32,17)
(32,19)-(32,21)
(33,4)-(34,51)
(33,15)-(33,44)
(33,15)-(33,23)
(33,24)-(33,44)
(33,25)-(33,37)
(33,38)-(33,40)
(33,41)-(33,43)
(34,4)-(34,51)
(34,18)-(34,44)
(34,18)-(34,32)
(34,33)-(34,34)
(34,35)-(34,39)
(34,40)-(34,44)
(34,48)-(34,51)
(35,2)-(35,34)
(35,2)-(35,12)
(35,13)-(35,34)
(35,14)-(35,17)
(35,18)-(35,33)
(35,19)-(35,26)
(35,27)-(35,29)
(35,30)-(35,32)
*)
