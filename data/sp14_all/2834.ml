
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
(26,26)-(26,71)
match i with
| 0 -> l
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,37)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,69)-(11,75)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(14,3)-(24,35)
(24,3)-(24,13)
(24,3)-(24,35)
(26,26)-(26,71)
(26,40)-(26,46)
(26,40)-(26,71)
(26,71)-(26,71)
*)
