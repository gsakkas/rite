
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
      | (carry,h1::t1) ->
          (match x with
           | h2::t2 ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: t1))) in
    let base = (0, l1) in
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
(23,4)-(30,68)
(23,10)-(28,72)
(23,12)-(28,72)
(24,6)-(28,72)
(24,12)-(24,13)
(26,10)-(28,72)
(26,17)-(26,18)
(28,15)-(28,71)
(28,16)-(28,42)
(28,17)-(28,36)
(28,18)-(28,27)
(28,19)-(28,21)
(28,24)-(28,26)
(28,30)-(28,35)
(28,39)-(28,41)
(28,44)-(28,70)
(29,4)-(30,68)
(31,2)-(31,34)
*)

(* type error slice
(5,3)-(14,63)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(7,2)-(14,61)
(8,2)-(14,61)
(10,6)-(11,61)
(11,6)-(11,61)
(11,6)-(11,61)
(11,19)-(11,24)
(11,19)-(11,28)
(11,32)-(11,61)
(11,33)-(11,35)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(14,6)-(14,61)
(14,19)-(14,24)
(14,19)-(14,28)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,52)
(14,53)-(14,55)
(22,2)-(31,34)
(22,11)-(30,68)
(23,4)-(30,68)
(23,10)-(28,72)
(23,12)-(28,72)
(24,6)-(28,72)
(24,6)-(28,72)
(24,12)-(24,13)
(26,10)-(28,72)
(26,10)-(28,72)
(26,17)-(26,18)
(28,18)-(28,27)
(28,19)-(28,21)
(29,4)-(30,68)
(29,15)-(29,22)
(29,19)-(29,21)
(30,4)-(30,68)
(30,15)-(30,17)
(30,35)-(30,49)
(30,35)-(30,61)
(30,50)-(30,51)
(30,52)-(30,56)
(30,57)-(30,61)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
*)
