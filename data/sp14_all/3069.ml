
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (fun help  ->
       fun n  -> match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec help n = match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else help n;;

*)

(* changed spans
(8,5)-(9,79)
help n
AppG (fromList [VarG])

*)

(* type error slice
(5,3)-(9,79)
(6,8)-(6,11)
(8,5)-(9,79)
*)
