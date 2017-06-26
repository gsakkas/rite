
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (0,[]) -> (0, [])
      | (carry,h1::t1) ->
          (match x with
           | h2::t2 ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: t1))) in
    let base = (0, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,4)-(31,68)
(23,10)-(29,72)
(23,12)-(29,72)
(24,6)-(29,72)
(24,12)-(24,13)
(25,18)-(25,25)
(25,22)-(25,24)
(27,10)-(29,72)
(27,17)-(27,18)
(29,15)-(29,71)
(29,16)-(29,42)
(29,17)-(29,36)
(29,18)-(29,27)
(29,19)-(29,21)
(29,24)-(29,26)
(29,30)-(29,35)
(29,39)-(29,41)
(29,44)-(29,70)
(29,45)-(29,63)
(29,46)-(29,55)
(29,47)-(29,49)
(29,52)-(29,54)
(29,60)-(29,62)
(29,67)-(29,69)
(30,4)-(31,68)
(30,15)-(30,22)
(30,19)-(30,21)
(31,4)-(31,68)
(31,15)-(31,17)
(31,21)-(31,68)
(31,35)-(31,49)
(31,35)-(31,61)
(31,50)-(31,51)
(31,52)-(31,56)
(31,57)-(31,61)
(31,65)-(31,68)
(32,2)-(32,34)
*)

(* type error slice
(3,30)-(3,31)
(3,30)-(3,52)
(3,35)-(3,52)
(3,36)-(3,41)
(3,42)-(3,43)
(5,3)-(14,63)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(7,2)-(14,61)
(8,2)-(14,61)
(10,6)-(11,61)
(11,6)-(11,61)
(11,19)-(11,24)
(11,19)-(11,28)
(11,25)-(11,26)
(11,32)-(11,61)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(22,2)-(32,34)
(22,11)-(31,68)
(23,4)-(31,68)
(23,10)-(29,72)
(23,12)-(29,72)
(27,10)-(29,72)
(27,17)-(27,18)
(31,4)-(31,68)
(31,15)-(31,17)
(31,35)-(31,49)
(31,35)-(31,61)
(31,50)-(31,51)
(31,57)-(31,61)
(32,13)-(32,34)
(32,14)-(32,17)
(32,18)-(32,33)
(32,19)-(32,26)
*)

(* all spans
(2,14)-(3,67)
(2,16)-(3,67)
(3,2)-(3,67)
(3,8)-(3,13)
(3,8)-(3,9)
(3,12)-(3,13)
(3,30)-(3,52)
(3,30)-(3,31)
(3,35)-(3,52)
(3,36)-(3,41)
(3,42)-(3,43)
(3,44)-(3,51)
(3,45)-(3,46)
(3,49)-(3,50)
(3,65)-(3,67)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(6,16)-(6,30)
(6,16)-(6,27)
(6,28)-(6,30)
(7,2)-(14,61)
(7,16)-(7,30)
(7,16)-(7,27)
(7,28)-(7,30)
(8,2)-(14,61)
(8,8)-(8,26)
(8,8)-(8,15)
(8,19)-(8,26)
(10,6)-(11,61)
(10,14)-(10,31)
(10,14)-(10,21)
(10,24)-(10,31)
(11,6)-(11,61)
(11,19)-(11,28)
(11,19)-(11,24)
(11,25)-(11,26)
(11,27)-(11,28)
(11,32)-(11,61)
(11,33)-(11,35)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(11,57)-(11,59)
(13,6)-(14,61)
(13,14)-(13,31)
(13,14)-(13,21)
(13,24)-(13,31)
(14,6)-(14,61)
(14,19)-(14,28)
(14,19)-(14,24)
(14,25)-(14,26)
(14,27)-(14,28)
(14,32)-(14,61)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,52)
(14,53)-(14,55)
(14,58)-(14,60)
(16,19)-(19,55)
(17,2)-(19,55)
(17,8)-(17,9)
(18,10)-(18,12)
(19,12)-(19,55)
(19,19)-(19,20)
(19,33)-(19,45)
(19,33)-(19,43)
(19,44)-(19,45)
(19,53)-(19,54)
(21,11)-(32,34)
(21,14)-(32,34)
(22,2)-(32,34)
(22,11)-(31,68)
(23,4)-(31,68)
(23,10)-(29,72)
(23,12)-(29,72)
(24,6)-(29,72)
(24,12)-(24,13)
(25,18)-(25,25)
(25,19)-(25,20)
(25,22)-(25,24)
(27,10)-(29,72)
(27,17)-(27,18)
(29,15)-(29,71)
(29,16)-(29,42)
(29,17)-(29,36)
(29,18)-(29,27)
(29,19)-(29,21)
(29,24)-(29,26)
(29,30)-(29,35)
(29,39)-(29,41)
(29,44)-(29,70)
(29,45)-(29,63)
(29,46)-(29,55)
(29,47)-(29,49)
(29,52)-(29,54)
(29,60)-(29,62)
(29,67)-(29,69)
(30,4)-(31,68)
(30,15)-(30,22)
(30,16)-(30,17)
(30,19)-(30,21)
(31,4)-(31,68)
(31,15)-(31,17)
(31,21)-(31,68)
(31,35)-(31,61)
(31,35)-(31,49)
(31,50)-(31,51)
(31,52)-(31,56)
(31,57)-(31,61)
(31,65)-(31,68)
(32,2)-(32,34)
(32,2)-(32,12)
(32,13)-(32,34)
(32,14)-(32,17)
(32,18)-(32,33)
(32,19)-(32,26)
(32,27)-(32,29)
(32,30)-(32,32)
*)
