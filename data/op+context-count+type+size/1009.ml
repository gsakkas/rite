
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rem = match a with | (x,y) -> x in
      match x with
      | (add_a,add_b) ->
          let new_carry = ((rem + add_a) + add_b) / 10 in
          let digit = ((rem + add_a) + add_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine (l1, l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rem = match a with | (x,y) -> x in
      match x with
      | (add_a,add_b) ->
          let new_carry = ((rem + add_a) + add_b) / 10 in
          let digit = ((rem + add_a) + add_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,26)-(24,46)
(24,40)-(24,46)
*)

(* type error slice
(2,4)-(2,68)
(2,15)-(2,64)
(2,17)-(2,64)
(2,21)-(2,64)
(2,21)-(2,64)
(2,24)-(2,25)
(2,24)-(2,30)
(2,24)-(2,30)
(2,24)-(2,30)
(2,29)-(2,30)
(2,36)-(2,38)
(2,44)-(2,45)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,50)-(2,64)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,60)
(2,59)-(2,64)
(2,63)-(2,64)
(4,4)-(9,48)
(4,13)-(9,45)
(4,16)-(9,45)
(5,15)-(5,26)
(5,15)-(5,29)
(5,15)-(5,29)
(5,27)-(5,29)
(6,15)-(6,26)
(6,15)-(6,29)
(6,15)-(6,29)
(6,27)-(6,29)
(8,9)-(8,11)
(8,9)-(8,44)
(8,15)-(8,20)
(8,15)-(8,37)
(8,15)-(8,44)
(8,40)-(8,41)
(8,42)-(8,44)
(9,11)-(9,40)
(9,36)-(9,37)
(9,38)-(9,40)
(11,20)-(12,75)
(12,3)-(12,75)
(12,3)-(12,75)
(12,3)-(12,75)
(12,3)-(12,75)
(12,3)-(12,75)
(12,9)-(12,10)
(12,24)-(12,26)
(12,37)-(12,75)
(12,40)-(12,41)
(12,40)-(12,45)
(12,51)-(12,61)
(12,51)-(12,63)
(14,4)-(26,37)
(14,12)-(26,33)
(14,15)-(26,33)
(15,3)-(26,33)
(15,12)-(25,52)
(16,5)-(25,52)
(16,11)-(22,59)
(16,13)-(22,59)
(17,7)-(22,59)
(17,17)-(17,42)
(17,17)-(17,42)
(17,23)-(17,24)
(17,41)-(17,42)
(18,13)-(18,14)
(20,29)-(20,32)
(20,35)-(20,40)
(20,44)-(20,49)
(22,18)-(22,19)
(22,58)-(22,59)
(23,5)-(25,52)
(23,17)-(23,22)
(23,20)-(23,22)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,46)
(24,16)-(24,46)
(24,26)-(24,38)
(24,26)-(24,46)
(24,26)-(24,46)
(24,40)-(24,42)
(24,40)-(24,46)
(24,44)-(24,46)
(25,19)-(25,33)
(25,19)-(25,45)
(25,19)-(25,45)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(26,15)-(26,18)
(26,15)-(26,33)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
*)
