
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
    let f a x = a + x in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,16)-(23,17)
(23,16)-(23,21)
(24,4)-(25,68)
(24,15)-(24,17)
(25,15)-(25,17)
(25,21)-(25,68)
*)

(* type error slice
(23,4)-(25,68)
(23,10)-(23,21)
(23,16)-(23,17)
(23,16)-(23,21)
(24,4)-(25,68)
(24,15)-(24,17)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
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
(21,11)-(26,34)
(21,14)-(26,34)
(22,2)-(26,34)
(22,11)-(25,68)
(23,4)-(25,68)
(23,10)-(23,21)
(23,12)-(23,21)
(23,16)-(23,21)
(23,16)-(23,17)
(23,20)-(23,21)
(24,4)-(25,68)
(24,15)-(24,17)
(25,4)-(25,68)
(25,15)-(25,17)
(25,21)-(25,68)
(25,35)-(25,61)
(25,35)-(25,49)
(25,50)-(25,51)
(25,52)-(25,56)
(25,57)-(25,61)
(25,65)-(25,68)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)
