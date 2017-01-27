
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
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
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
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,r) -> ((h1 :: t1), (bigAdd ((mulByDigit x h1) :: t1) r))
    | _ -> ([], []) in
  let base = ((List.rev l1), [1]) in
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
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
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
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,r) -> ((h1 :: t1), (bigAdd (mulByDigit x (h1 :: t1)) r))
    | _ -> ([], []) in
  let base = ((List.rev l1), [1]) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(27,15)-(27,17)
(27,19)-(27,21)
(44,44)-(44,66)
(44,57)-(44,59)
(45,13)-(45,15)
(45,17)-(45,19)
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
(21,4)-(30,37)
(21,12)-(30,33)
(21,15)-(30,33)
(22,3)-(30,33)
(22,12)-(29,78)
(23,5)-(29,78)
(23,11)-(27,21)
(23,13)-(27,21)
(24,7)-(27,21)
(24,13)-(24,14)
(26,12)-(26,14)
(26,12)-(26,73)
(26,20)-(26,26)
(26,20)-(26,73)
(26,25)-(26,26)
(28,5)-(29,78)
(28,18)-(28,26)
(28,18)-(28,29)
(28,18)-(28,35)
(28,27)-(28,29)
(28,32)-(28,35)
(28,33)-(28,34)
(29,5)-(29,78)
(29,16)-(29,24)
(29,16)-(29,27)
(29,25)-(29,27)
(29,31)-(29,78)
(29,45)-(29,59)
(29,45)-(29,71)
(29,60)-(29,61)
(29,62)-(29,66)
(29,67)-(29,71)
(29,75)-(29,78)
(30,3)-(30,13)
(30,3)-(30,33)
(30,15)-(30,18)
(30,15)-(30,33)
(30,20)-(30,27)
(30,20)-(30,33)
(30,28)-(30,30)
(30,31)-(30,33)
(44,35)-(44,41)
(44,35)-(44,69)
(44,44)-(44,66)
(44,68)-(44,69)
*)
