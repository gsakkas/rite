
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  ((List.append (clone 0 (len2 - len1)) l1),
    (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (i,l) ->
          (match x with
           | (x1,x2) ->
               ((((x1 + x2) + i) / 10), ((((x1 + x2) + i) mod 10) :: l))) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(26,25)-(26,70)
(26,28)-(26,33)
(26,32)-(26,33)
*)

(* type error slice
(11,36)-(11,74)
(11,36)-(11,74)
(11,50)-(11,60)
(11,50)-(11,62)
(11,68)-(11,74)
(13,3)-(24,36)
(13,11)-(24,34)
(13,14)-(24,34)
(14,2)-(24,34)
(24,2)-(24,12)
(24,2)-(24,34)
(26,25)-(26,70)
(26,25)-(26,70)
(26,25)-(26,70)
(26,39)-(26,45)
(26,39)-(26,70)
*)
