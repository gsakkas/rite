let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let digits =
  fun n -> digitsOfInt (abs n)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n ->
    if (sumList (digits n) / 10) <> 0
    then additivePersistence (sumList (digits n)) + 1
    else 1


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let digits =
  fun n -> digitsOfInt (abs n)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n ->
    if (sumList (digits n) / 10) <> 0
    then additivePersistence (sumList (digits 10)) + 1
    else 1


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [n mod 10] in
     if (n / 10) <> 0
     then ((n mod 10) :: return;
     digitsOfInt (n / 10) @ return)
     else return)

let digits =
  fun n -> digitsOfInt (abs n)

let rec sumList =
  fun xs ->
    match xs with
    | [] -> 0
    | h :: t -> h + sumList t

let rec additivePersistence =
  fun n ->
    if (sumList (digits n) / 10) <> 0
    then additivePersistence (sumList (digits __var_1__)) + 1
    else 1


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) <> 0
  then (additivePersistence (sumList digits n)) + 1
  else 1;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) <> 0
  then (additivePersistence (sumList (digits n))) + 1
  else 1;;

*)

(* changed spans

(14,29)-(14,47)
sumList (digits n)
AppG [AppG [EmptyG]]

*)
