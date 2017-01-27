
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
      | (carry,result) ->
          (match x with
           | (h1::t1,h2::t2) ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: result))) in
    let base = (0, []) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(23,5)-(30,75)
(23,11)-(28,74)
(23,13)-(28,74)
(24,7)-(28,74)
(24,13)-(24,14)
(26,12)-(28,74)
(26,18)-(26,19)
(28,20)-(28,22)
(28,20)-(28,27)
(28,20)-(28,36)
(28,20)-(28,42)
(28,20)-(28,74)
(28,25)-(28,27)
(28,31)-(28,36)
(28,40)-(28,42)
(28,48)-(28,74)
(29,5)-(30,75)
(31,3)-(31,33)
*)

(* type error slice
(23,5)-(30,75)
(23,11)-(28,74)
(23,13)-(28,74)
(24,7)-(28,74)
(24,13)-(24,14)
(26,12)-(28,74)
(26,18)-(26,19)
(28,20)-(28,36)
(28,20)-(28,42)
(28,20)-(28,74)
(28,31)-(28,36)
(28,48)-(28,63)
(28,48)-(28,74)
(28,68)-(28,74)
(29,5)-(30,75)
(29,17)-(29,18)
(29,17)-(29,22)
(29,20)-(29,22)
(30,5)-(30,75)
(30,17)-(30,19)
(30,17)-(30,23)
(30,21)-(30,23)
(30,42)-(30,56)
(30,42)-(30,68)
(30,57)-(30,58)
(30,59)-(30,63)
(30,64)-(30,68)
*)
