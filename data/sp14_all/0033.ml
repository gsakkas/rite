
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
      match a with | [] -> (l1, [0; 0; 0; 0]) | h1::t1 -> (l1, [0; 0; 0; 0]) in
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
  let add (l1,l2) =
    let f a x = match a with | (h1::t1,_) -> (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,7)-(24,77)
match a with
| (h1 :: t1 , _) -> (l1 , [0 ; 0 ; 0 ; 0])
CaseG (fromList [(TuplePatG (fromList [ConsPatG EmptyPatG EmptyPatG,WildPatG]),Nothing,TupleG (fromList [EmptyG]))])

*)

(* type error slice
(23,5)-(26,69)
(23,11)-(24,77)
(23,13)-(24,77)
(24,7)-(24,77)
(24,13)-(24,14)
(24,28)-(24,46)
(26,36)-(26,50)
(26,36)-(26,62)
(26,51)-(26,52)
*)
