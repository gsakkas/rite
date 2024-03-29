let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then return
      else (n mod 10) :: (n :: __var_1__);
     []))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then return
      else (n mod 10) :: [n]; []))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then return
      else (n mod 10) :: [n ; n];
     []))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n /. 10) :: return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (n / 10) :: return;;

*)

(* changed spans

(4,52)-(4,61)
n / 10
BopG VarG LitG

*)
