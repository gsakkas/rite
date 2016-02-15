let append x xs =
  match xs with
  | [] -> [x]
  | _  -> x :: xs

let rec digitsOfInt n =
  if n <= 0
  then []
  else append (digitsOfInt (n / 10)) [n mod 10]

let _ = digitsOfInt 1
