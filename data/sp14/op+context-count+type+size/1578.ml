
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
(5,4)-(14,64)
(5,13)-(14,61)
(14,35)-(14,46)
(14,35)-(14,56)
(14,54)-(14,56)
(21,4)-(29,37)
(21,12)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(36,15)-(36,21)
(36,15)-(36,25)
(36,22)-(36,23)
(37,15)-(37,21)
(37,15)-(37,66)
(37,23)-(37,33)
(37,23)-(37,43)
(37,42)-(37,43)
(41,3)-(45,76)
(41,9)-(43,68)
(42,5)-(43,68)
(42,5)-(43,68)
(42,11)-(42,12)
(43,32)-(43,38)
(43,32)-(43,68)
(43,41)-(43,51)
(43,41)-(43,57)
(43,41)-(43,64)
(43,41)-(43,64)
(43,55)-(43,57)
(44,3)-(45,76)
(44,16)-(44,33)
(44,30)-(44,33)
(44,30)-(44,33)
(44,31)-(44,32)
(45,43)-(45,57)
(45,43)-(45,69)
(45,58)-(45,59)
(45,60)-(45,64)
*)
