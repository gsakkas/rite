
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
    | (h1::t1,rh::rt) -> (t1, ((bigAdd (mulByDigit x rh) rt) :: rt)) in
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
    | (h1::t1,r) -> (t1, (bigAdd (mulByDigit h1 (List.append r [0])) r)) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(43,4)-(44,68)
(44,30)-(44,67)
(44,51)-(44,52)
(44,53)-(44,55)
(44,57)-(44,59)
(44,64)-(44,66)
(45,2)-(46,75)
(45,14)-(45,27)
(45,15)-(45,23)
(45,29)-(45,32)
(45,30)-(45,31)
(46,13)-(46,21)
(46,13)-(46,24)
(46,28)-(46,75)
*)

(* type error slice
(19,12)-(19,60)
(19,12)-(19,60)
(19,33)-(19,43)
(19,33)-(19,45)
(19,53)-(19,59)
(21,3)-(30,36)
(21,11)-(30,34)
(21,14)-(30,34)
(22,2)-(30,34)
(30,2)-(30,12)
(30,2)-(30,34)
(37,14)-(37,20)
(37,14)-(37,24)
(37,21)-(37,22)
(38,14)-(38,20)
(38,14)-(38,66)
(38,21)-(38,43)
(38,22)-(38,32)
(38,41)-(38,42)
(38,44)-(38,66)
(38,45)-(38,55)
(42,2)-(46,75)
(42,8)-(44,68)
(43,4)-(44,68)
(43,4)-(44,68)
(43,4)-(44,68)
(43,10)-(43,11)
(44,30)-(44,67)
(44,30)-(44,67)
(44,31)-(44,60)
(44,32)-(44,38)
(44,39)-(44,56)
(44,40)-(44,50)
(44,53)-(44,55)
(44,57)-(44,59)
(44,64)-(44,66)
(45,2)-(46,75)
(45,13)-(45,33)
(45,29)-(45,32)
(45,29)-(45,32)
(45,30)-(45,31)
(46,42)-(46,56)
(46,42)-(46,68)
(46,57)-(46,58)
(46,59)-(46,63)
*)
