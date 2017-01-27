
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
    let base = [0] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
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
(23,17)-(23,18)
(23,17)-(23,22)
(24,5)-(25,72)
(24,16)-(24,19)
(24,17)-(24,18)
(25,5)-(25,72)
(25,16)-(25,18)
(25,16)-(25,21)
(25,19)-(25,21)
(25,25)-(25,72)
(25,39)-(25,53)
(25,39)-(25,65)
(25,54)-(25,55)
(25,56)-(25,60)
(25,61)-(25,65)
(25,69)-(25,72)
(26,3)-(26,13)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(2,4)-(7,26)
(2,15)-(7,23)
(2,17)-(7,23)
(3,3)-(7,23)
(6,24)-(6,35)
(6,24)-(6,46)
(6,36)-(6,38)
(6,40)-(6,46)
(7,3)-(7,14)
(7,3)-(7,23)
(7,15)-(7,16)
(7,18)-(7,21)
(7,18)-(7,23)
(7,22)-(7,23)
(9,4)-(12,77)
(9,13)-(12,74)
(9,16)-(12,74)
(10,3)-(12,74)
(10,10)-(10,21)
(10,10)-(10,24)
(10,22)-(10,24)
(10,29)-(10,40)
(10,29)-(10,43)
(10,41)-(10,43)
(11,15)-(11,17)
(11,15)-(11,72)
(11,21)-(11,26)
(11,21)-(11,64)
(11,21)-(11,72)
(11,27)-(11,28)
(11,31)-(11,64)
(11,68)-(11,69)
(11,70)-(11,72)
(22,3)-(26,33)
(22,12)-(25,72)
(23,5)-(25,72)
(23,11)-(23,22)
(23,13)-(23,22)
(23,17)-(23,18)
(23,17)-(23,22)
(23,21)-(23,22)
(24,5)-(25,72)
(24,16)-(24,19)
(24,17)-(24,18)
(25,5)-(25,72)
(25,16)-(25,18)
(25,16)-(25,21)
(25,19)-(25,21)
(25,25)-(25,72)
(25,39)-(25,53)
(25,39)-(25,65)
(25,54)-(25,55)
(25,56)-(25,60)
(25,61)-(25,65)
(25,69)-(25,72)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)
