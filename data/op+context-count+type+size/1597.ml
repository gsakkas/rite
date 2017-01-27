
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
      | (h1::t1,h2::t2) -> (match x with | h3::t3 -> (t1, (h1 :: h3 :: t3))) in
    let base = (l1, []) in
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
(23,5)-(27,69)
(23,11)-(25,74)
(23,13)-(25,74)
(24,7)-(25,74)
(24,13)-(24,14)
(25,29)-(25,74)
(25,35)-(25,36)
(25,55)-(25,57)
(25,55)-(25,74)
(25,60)-(25,62)
(25,60)-(25,74)
(25,66)-(25,68)
(25,66)-(25,74)
(25,72)-(25,74)
(26,5)-(27,69)
(28,3)-(28,33)
*)

(* type error slice
(3,37)-(3,42)
(3,37)-(3,51)
(3,43)-(3,44)
(3,46)-(3,51)
(5,4)-(14,64)
(5,13)-(14,61)
(5,16)-(14,61)
(6,3)-(14,61)
(6,17)-(6,28)
(6,17)-(6,31)
(6,29)-(6,31)
(7,3)-(14,61)
(7,17)-(7,28)
(7,17)-(7,31)
(7,29)-(7,31)
(8,3)-(14,61)
(10,7)-(11,60)
(10,15)-(10,32)
(11,7)-(11,60)
(11,20)-(11,25)
(11,20)-(11,29)
(11,26)-(11,27)
(11,28)-(11,29)
(11,34)-(11,36)
(11,34)-(11,60)
(11,39)-(11,50)
(11,39)-(11,60)
(11,51)-(11,57)
(11,58)-(11,60)
(22,3)-(28,33)
(22,12)-(27,69)
(23,5)-(27,69)
(23,11)-(25,74)
(23,13)-(25,74)
(24,7)-(25,74)
(24,13)-(24,14)
(25,29)-(25,74)
(25,35)-(25,36)
(25,55)-(25,57)
(25,55)-(25,74)
(25,60)-(25,74)
(26,5)-(27,69)
(26,17)-(26,19)
(26,17)-(26,23)
(26,21)-(26,23)
(27,5)-(27,69)
(27,16)-(27,18)
(27,22)-(27,69)
(27,36)-(27,50)
(27,36)-(27,62)
(27,51)-(27,52)
(27,53)-(27,57)
(27,58)-(27,62)
(27,66)-(27,69)
(28,15)-(28,18)
(28,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)
