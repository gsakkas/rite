
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = bigAdd a x in
  let base = [] in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (f,[]) -> f | (f',g'::h) -> g' in
      let newc =
        match x with | (f,g) -> if ((f + g) + carry) > 9 then 1 else 0 in
      let digit = match x with | (f,g) -> ((f + g) + carry) mod 10 in
      match a with
      | (o,p::q) -> (0, (newc :: digit :: q))
      | (o,p) -> (0, (newc :: digit :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 1 then l else bigAdd (mulByDigit (i - 1) l) l;;

let bigMul l1 l2 =
  let f a x = match a with | (_,y) -> (0, (bigAdd y x)) in
  let base = (0, []) in
  let args =
    let rec constructargs acc a b =
      match b with
      | [] -> acc
      | h::t -> constructargs ((mulByDigit h b) :: acc) a t in
    constructargs [] l1 (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(31,15)-(31,25)
match a with
| (_ , y) -> (0 , bigAdd y x)
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,TupleG [EmptyG,EmptyG])]

(32,14)-(32,16)
(0 , [])
TupleG [LitG,ListG []]

*)

(* type error slice
(11,3)-(11,69)
(11,9)-(11,10)
(11,36)-(11,69)
(11,50)-(11,60)
(11,50)-(11,62)
(11,68)-(11,69)
(13,4)-(26,37)
(13,12)-(26,35)
(13,15)-(26,35)
(14,3)-(26,35)
(26,3)-(26,13)
(26,3)-(26,35)
(31,3)-(39,50)
(31,9)-(31,25)
(31,11)-(31,25)
(31,15)-(31,21)
(31,15)-(31,25)
(39,3)-(39,50)
(39,17)-(39,31)
(39,17)-(39,43)
(39,32)-(39,33)
*)
