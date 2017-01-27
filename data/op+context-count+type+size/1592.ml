
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
      | (_,h2::t2) ->
          (match x with | [] -> (t2, [h2]) | h3::t3 -> (t2, (h2 :: h3 :: t3))) in
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
(23,5)-(28,69)
(23,11)-(26,76)
(23,13)-(26,76)
(24,7)-(26,76)
(24,13)-(24,14)
(26,12)-(26,76)
(26,18)-(26,19)
(26,34)-(26,36)
(26,34)-(26,42)
(26,38)-(26,42)
(26,39)-(26,41)
(26,57)-(26,59)
(26,57)-(26,76)
(26,62)-(26,64)
(26,62)-(26,76)
(26,68)-(26,76)
(27,5)-(28,69)
(29,3)-(29,33)
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
(22,3)-(29,33)
(22,12)-(28,69)
(23,5)-(28,69)
(23,11)-(26,76)
(23,13)-(26,76)
(24,7)-(26,76)
(24,13)-(24,14)
(26,12)-(26,76)
(26,18)-(26,19)
(26,34)-(26,36)
(26,34)-(26,42)
(26,38)-(26,42)
(26,39)-(26,41)
(27,5)-(28,69)
(27,17)-(27,19)
(27,17)-(27,23)
(27,21)-(27,23)
(28,5)-(28,69)
(28,16)-(28,18)
(28,22)-(28,69)
(28,36)-(28,50)
(28,36)-(28,62)
(28,51)-(28,52)
(28,53)-(28,57)
(28,58)-(28,62)
(28,66)-(28,69)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(29,31)-(29,33)
*)
