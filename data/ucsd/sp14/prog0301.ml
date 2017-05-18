
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with
  | [] -> count
  | _ -> additivePersistence ((sumList (digitsOfInt n)) (count + 1));;
