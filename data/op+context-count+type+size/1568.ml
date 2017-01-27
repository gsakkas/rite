
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
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,rh::rt) -> (t1, (bigAdd ((mulByDigit h1 rh) :: rt) rt)) in
  let base = ((List.rev l1), [0]) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> if i = 1 then l else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,rh::rt) -> (t1, (bigAdd (mulByDigit h1 (rh :: rt)) rt)) in
  let base = ((List.rev l1), [0]) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(43,41)-(43,64)
(43,55)-(43,57)
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
(17,3)-(19,60)
(19,34)-(19,44)
(19,34)-(19,46)
(19,45)-(19,46)
(21,4)-(29,37)
(21,12)-(29,33)
(21,15)-(29,33)
(22,3)-(29,33)
(22,12)-(28,78)
(23,5)-(28,78)
(23,11)-(26,73)
(23,13)-(26,73)
(24,7)-(26,73)
(24,13)-(24,14)
(26,12)-(26,14)
(26,12)-(26,73)
(26,20)-(26,26)
(26,20)-(26,73)
(26,25)-(26,26)
(27,5)-(28,78)
(27,18)-(27,26)
(27,18)-(27,29)
(27,18)-(27,35)
(27,27)-(27,29)
(27,32)-(27,35)
(27,33)-(27,34)
(28,5)-(28,78)
(28,16)-(28,24)
(28,16)-(28,27)
(28,25)-(28,27)
(28,31)-(28,78)
(28,45)-(28,59)
(28,45)-(28,71)
(28,60)-(28,61)
(28,62)-(28,66)
(28,67)-(28,71)
(28,75)-(28,78)
(29,3)-(29,13)
(29,3)-(29,33)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(29,31)-(29,33)
(41,3)-(45,76)
(41,9)-(43,68)
(41,11)-(43,68)
(42,5)-(43,68)
(42,11)-(42,12)
(43,27)-(43,29)
(43,27)-(43,68)
(43,32)-(43,38)
(43,32)-(43,68)
(43,41)-(43,64)
(43,66)-(43,68)
(44,3)-(45,76)
(44,16)-(44,24)
(44,16)-(44,27)
(44,16)-(44,33)
(44,25)-(44,27)
(44,30)-(44,33)
(44,31)-(44,32)
(45,3)-(45,76)
(45,14)-(45,22)
(45,14)-(45,25)
(45,23)-(45,25)
(45,43)-(45,57)
(45,43)-(45,69)
(45,58)-(45,59)
(45,60)-(45,64)
(45,65)-(45,69)
*)
