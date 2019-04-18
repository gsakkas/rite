
let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | h::t -> listReverse ns
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in lr [] l;;

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | _ -> listReverse ns
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(7,3)-(10,68)
match n with
| _ -> listReverse ns
| 0 -> ns
| n -> if n < 0
       then []
       else (n mod 10) :: (digitsOfInt (n / 10))
CaseG (fromList [(VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(5,4)-(10,70)
(5,21)-(10,68)
(7,3)-(10,68)
(7,9)-(7,10)
(10,13)-(10,14)
(10,13)-(10,18)
(10,17)-(10,18)
(10,46)-(10,68)
(10,47)-(10,58)
(10,59)-(10,67)
*)
