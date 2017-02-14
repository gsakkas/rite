
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
          if (h1 + x) > 9
          then (t1, [(h1 + x) / 10; (h1 + x) mod 10])
          else [(h1 + x) mod 10]
      | (h1::t1,rh::rt) ->
          if ((h1 + x) + rh) > 9
          then
            (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
          else (((h1 + x) + rh) mod 10) :: rt in
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
          if (h1 + x) > 9
          then (t1, [(h1 + x) / 10; (h1 + x) mod 10])
          else (t1, [(h1 + x) mod 10])
      | (h1::t1,rh::rt) ->
          if ((h1 + x) + rh) > 9
          then
            (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
          else (t1, ((((h1 + x) + rh) mod 10) :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,15)-(28,32)
(33,15)-(33,45)
(36,19)-(36,26)
(36,27)-(36,29)
(36,30)-(36,32)
*)

(* type error slice
(26,10)-(28,32)
(26,10)-(28,32)
(27,15)-(27,53)
(28,15)-(28,32)
(30,10)-(33,45)
(30,10)-(33,45)
(32,12)-(32,76)
(33,15)-(33,45)
*)
