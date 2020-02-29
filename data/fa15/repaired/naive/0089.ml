let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec digitalRoot =
  fun n ->
    (let digits = digitsOfInt n in
     let s = sumList digits in
     if (n / 10) <> 0
     then (print_int n;
     print_endline " "; __var_1__)
     else digits)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec digitalRoot =
  fun n ->
    (let digits = digitsOfInt n in
     let s = sumList digits in
     if (n / 10) <> 0
     then (print_int n;
     print_endline " ";
     digitsOfInt 10)
     else digits)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec digitalRoot =
  fun n ->
    (let digits = digitsOfInt n in
     let s = sumList digits in
     if (n / 10) <> 0
     then (print_int n;
     print_endline " ";
     digitsOfInt __lit__)
     else digits)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let digits = digitsOfInt n in
  let s = sumList digits in
  if (n / 10) <> 0
  then (print_int n; print_endline " "; digitalRoot)
  else digits;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let d = digits n in
  let s = sumList d in if (n / 10) <> 0 then digitalRoot s else s;;

*)

(* changed spans

(11,3)-(15,14)
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
LetG NonRec [(VarPatG,AppG [EmptyG])] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)
