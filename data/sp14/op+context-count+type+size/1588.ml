
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
    let base = [] in
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
(23,4)-(30,68)
(23,10)-(28,72)
(24,6)-(28,72)
(24,12)-(24,13)
(29,4)-(30,68)
(29,15)-(29,17)
(30,35)-(30,49)
(30,35)-(30,61)
(30,50)-(30,51)
(30,52)-(30,56)
*)
