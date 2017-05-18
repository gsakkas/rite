
let rec listReverse2 l dest =
  match l with | [] -> dest | h::t -> listReverse2 t (h :: dest);;

let rec digitsOfInt n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitsToList n =
  match n / 10 with
  | 0 -> [n mod 10]
  | _ -> (n mod 10) :: (digitsOfInt (n / 10));;

let rec listReverse l = listReverse2 l [];;

let digitsOfInt n = listReverse (digitsToList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot2 num total =
  total +
    (if (num mod 10) <> 0 then digitalRoot2 (sumList (digits num)) else 0);;
