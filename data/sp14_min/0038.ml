
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
      | (h1::t1,[]) ->
          ((List.rev List.tl (List.rev (h1 :: t1))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev List.tl (List.rev (h1 :: t1))), ((((h1 + x) + rh) / 10)
            :: (((h1 + x) + rh) mod 10) :: rt)) in
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
    let f a x =
      match a with
      | (h1::t1,[]) ->
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            [(h1 + x) / 10; (h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          ((List.rev (List.tl (List.rev (h1 :: t1)))),
            ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,12)-(26,52)
List.rev (List.tl (List.rev (h1 :: t1)))
AppG [AppG [EmptyG]]

(29,12)-(29,52)
List.rev (List.tl (List.rev (h1 :: t1)))
AppG [AppG [EmptyG]]

*)

(* type error slice
(26,12)-(26,52)
(26,13)-(26,21)
(29,12)-(29,52)
(29,13)-(29,21)
*)
