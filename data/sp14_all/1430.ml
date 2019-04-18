
let palindrome w = if w = [] then true;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  let rec r_palindrome ex rev_ex =
    match (ex, rev_ex) with
    | ([],[]) -> true
    | (h1::t1,h2::t2) -> if h1 = h2 then r_palindrome t1 t2 else false
    | (ex,rev_ex) -> false in
  r_palindrome (explode w) (listReverse (explode w));;

*)

(* changed spans
(2,20)-(2,39)
let rec r_palindrome =
  fun ex ->
    fun rev_ex ->
      match (ex , rev_ex) with
      | ([] , []) -> true
      | (h1 :: t1 , h2 :: t2) -> if h1 = h2
                                 then r_palindrome t1 t2
                                 else false
      | (ex , rev_ex) -> false in
r_palindrome (explode w)
             (listReverse (explode w))
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,20)-(2,39)
(2,35)-(2,39)
(2,39)-(2,39)
*)
